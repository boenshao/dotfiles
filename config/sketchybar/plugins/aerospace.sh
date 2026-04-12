#!/usr/bin/env bash
if [[ "$SENDER" = "aerospace_workspace_change" ]]; then
  if [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
    sketchybar --set $NAME background.drawing=on
  else
    sketchybar --set $NAME background.drawing=off
  fi
fi
if [[ "$SENDER" = mouse.scrolled* ]]; then
  if [[ "$SCROLL_DELTA" -gt 0 ]]; then
    aerospace list-workspaces --monitor 1 | aerospace workspace --stdin prev
  else
    aerospace list-workspaces --monitor 1 | aerospace workspace --stdin next
  fi
fi
