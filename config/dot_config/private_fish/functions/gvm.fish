function gvm --description "Go Version Manager"
    set -l GVM_ROOT $HOME/goroot
    set -l GVM_CURRENT $GVM_ROOT/current

    set -l cmd $argv[1]
    set -l ver $argv[2]

    # ตัด prefix "go" ออก เพื่อให้ใช้ได้ทั้ง 1.22.0 และ go1.22.0
    set ver (string replace -r '^go' '' -- "$ver")

    switch "$cmd"
        case install
            if test -z "$ver"
                echo "Usage: gvm install <version>"
                return 1
            end

            if test -d $GVM_ROOT/go$ver
                echo "⚠️  go$ver is already installed"
                return 0
            end

            # Detect OS
            set -l os (uname -s | tr '[:upper:]' '[:lower:]')

            # Detect Architecture
            set -l arch (uname -m)
            switch $arch
                case x86_64
                    set arch amd64
                case aarch64 arm64
                    set arch arm64
            end

            set -l url "https://go.dev/dl/go$ver.$os-$arch.tar.gz"
            set -l tmp "$HOME/go$ver.tar.gz"

            echo "🔍 Detected: $os / $arch"
            echo "🔗 URL: $url"
            echo "🚀 installing go$ver..."

            if not curl -fL $url -o $tmp
                echo "❌ download failed (check version: $ver)"
                rm -f $tmp
                return 1
            end

            mkdir -p $GVM_ROOT/go$ver
            if not tar -C $GVM_ROOT/go$ver -xzf $tmp --strip-components=1
                echo "❌ extract failed"
                rm -rf $GVM_ROOT/go$ver
                rm -f $tmp
                return 1
            end
            rm -f $tmp

            echo "✅ go$ver installed!"
            echo "👉 run: gvm use $ver"

        case use
            if test -z "$ver"
                echo "Usage: gvm use <version>"
                return 1
            end

            if not test -d $GVM_ROOT/go$ver
                echo "❌ go$ver is not installed (run: gvm install $ver)"
                return 1
            end

            # สร้าง symlink ชี้ไปยังเวอร์ชันที่เลือก
            rm -f $GVM_CURRENT
            ln -s $GVM_ROOT/go$ver $GVM_CURRENT
			fish_add_path --move --prepend $GVM_CURRENT/bin

            echo "✅ now using go$ver"
            $GVM_CURRENT/bin/go version
        case list ls
            if not test -d $GVM_ROOT
                echo "No versions installed"
                return 0
            end

            set -l active ""
            if test -L $GVM_CURRENT
                set active (basename (readlink $GVM_CURRENT))
            end

            set -l found 0
            for dir in $GVM_ROOT/go*
                test -d $dir; or continue
                set found 1
                set -l name (basename $dir)
                if test "$name" = "$active"
                    echo "* $name (active)"
                else
                    echo "  $name"
                end
            end

            if test $found -eq 0
                echo "No versions installed"
            end

        case remove rm uninstall
            if test -z "$ver"
                echo "Usage: gvm remove <version>"
                return 1
            end

            if not test -d $GVM_ROOT/go$ver
                echo "❌ go$ver is not installed"
                return 1
            end

            # ถ้ากำลังใช้เวอร์ชันนี้อยู่ ให้แจ้งเตือนและเคลียร์ symlink
            if test -L $GVM_CURRENT
                if test (basename (readlink $GVM_CURRENT)) = "go$ver"
                    echo "⚠️  go$ver is currently active, unlinking..."
                    rm -f $GVM_CURRENT
                end
            end

            rm -rf $GVM_ROOT/go$ver
            echo "🗑️  go$ver removed"

        case '' help -h --help
            echo "Go Version Manager"
            echo ""
            echo "Usage:"
            echo "  gvm install <version>   Install a Go version (e.g. 1.22.0)"
            echo "  gvm use <version>       Switch to an installed version"
            echo "  gvm list                List installed versions"
            echo "  gvm remove <version>    Remove an installed version"

        case '*'
            echo "Unknown command: $cmd"
            echo "Run 'gvm help' for usage"
            return 1
    end
end
