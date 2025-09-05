#!/usr/bin/env bash

function dev {
  local WRONG_COMMAND=0

  if [ "$1" = "worktree" ]; then
    if [ "$2" = "add" ]; then
      if [ "$#" -eq 4 ]; then
        git worktree add "../$3" -b "$4"

        cp .env "../$3"
        cp config/pick.php "../$3/config"
        cp database/migrations/2018_08_08_100000_create_telescope_entries_table.php "../$3"
        cp database/migrations/2024_06_10_204329_create_esp_dmarc_table.php "../$3"
        cp database/migrations/2024_12_10_164851_add_index_to_blocklist_results_table.php "../$3"
        cp auth.json "../$3"

        cd "../$3" && composer install
      else
        WRONG_COMMAND=1
      fi
    elif [ "$2" = "remove" ]; then
      if [ "$#" -eq 3 ]; then
        git worktree remove "../$3" --force
      else
        WRONG_COMMAND=1
      fi
    elif [ "$2" = "list" ]; then
      git worktree list
    else
      WRONG_COMMAND=1
    fi
  else
    WRONG_COMMAND=1
  fi

  if [ $WRONG_COMMAND -eq 1 ]; then
    echo "Unknown command: $0 $*"

    echo "Usage: $0 worktree [add|remove|list] [path] [branch]"
  fi

}

function _dev {
  COMPREPLY=()

  local COMMANDS="worktree"
  local ACTIONS="add remove list"
  local WORKTREES="inboxmonster2 inboxmonster3 inboxmonster4 inboxmonster5"

  if [ "$COMP_CWORD" -eq 1 ]; then
    local CURRENT_WORD=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(compgen -W "$COMMANDS" -- $CURRENT_WORD))
  elif [ "$COMP_CWORD" -eq 2 ]; then
    local CURRENT_WORD=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(compgen -W "$ACTIONS" -- $CURRENT_WORD))
  elif [ "$COMP_CWORD" -eq 3 ]; then
    local CURRENT_WORD=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(compgen -W "$WORKTREES" -- $CURRENT_WORD))
  else
    COMPREPLY=($(ls))
  fi
}

complete -F _dev dev
