#!/usr/bin/env bash

if [[ $# -ne 1 ]] ; then
    echo "usage: tweets_template.sh node"
    exit
fi

curl -H 'Content-Type: application/json' -XPUT 'http://'$1'/_template/tweets' -d '
{
  "index_patterns": ["tweets-*"],
  "mappings": {
      "properties": {
        "timestamp_ms": {
          "type": "date",
          "format": "epoch_millis"
        },
        "created_at": {
          "type": "text",
          "fields": {
            "keyword": { 
              "type":  "keyword"
            }
          }
        },
        "time_zone": {
          "type": "keyword" 
        },
        "utc_offset": {
          "type": "keyword"
        },
        "id_str": {
          "type": "keyword"
        },
        "text": {
          "type": "text",
          "fields": {
            "keyword": { 
              "type":  "keyword"
            }
          }
        },
        "favorited": {
          "type": "boolean"
        },
        "retweeted": {
          "type": "boolean"
        },
        "possibly_sensitive": {
          "type": "boolean"
        },
        "lang": {
          "type": "keyword"
        },
        "user_id_str": {
          "type": "keyword"
        },
        "user_name": {
          "type": "keyword"
        },
        "user_screen_name": {
          "type": "keyword",
          "fields": {
            "keyword": { 
              "type":  "keyword"
            }
          }
        },
        "user_description": {
          "type": "text"
        },
        "user_verified": {
          "type": "boolean"
        },
        "users_followers_count": {
          "type": "integer"
        },
        "users_friends_count": {
          "type": "integer"
        },
        "users_listed_count": {
          "type": "integer"
        },
        "user_favourites_count": {
          "type": "integer"
        },
        "user_created_at": {
          "type": "text",
          "fields": {
            "keyword": { 
              "type":  "keyword"
            }
          }
        },
        "user_lang": {
          "type": "keyword"
        }
      }
    }
 }'

echo
