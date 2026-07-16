function claudes
    set -l MODELFILE $MYCONFIG/claude-model.json
    set -l CONFIGFILE $MYCONFIG/claude-config.json

    if test -f $MODELFILE
        set -l KEY $(cat $MODELFILE | jq 'keys.[]' |  fzf)

        if test "$KEY" = "normal"
            set -e ANTHROPIC_BASE_URL
            set -e ANTHROPIC_AUTH_TOKEN
            echo "" > $CONFIGFILE
            claude $argv
        else if test -n "$KEY"
            set -l URL $(cat $MODELFILE | jq .$KEY.url )
            set -l TOKEN $(cat $MODELFILE | jq .$KEY.token )

            if test -n "$URL"
                echo "export ANTHROPIC_BASE_URL=$URL" > $CONFIGFILE
                echo "export ANTHROPIC_AUTH_TOKEN=$TOKEN" >> $CONFIGFILE

                set -gx ANTHROPIC_BASE_URL $URL
                set -gx ANTHROPIC_AUTH_TOKEN $TOKEN
        
                set -l MODEL $(curl -H "Authorization: Bearer $ANTHROPIC_AUTH_TOKEN" $ANTHROPIC_BASE_URL/v1/models | jq .data.[].id | fzf)
                
                if test -n "$MODEL"
                 claude --model "$MODEL" $argv
                end
            else
                echo "$KEY no url"
            end
        end
    else
        echo "$MODELFILE not found"
    end
end
