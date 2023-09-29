#!/bin/sh

DOT_WORKSPACE_YML=".dot-workspace.yml"
FILES_NAME_SPACE="/files/"
CONTENT_TYPES_NAME_SPACE="/content-types/"
LANGUAGES_NAME_SPACE="/languages/"
SITES_NAME_SPACE="/sites/"
DEFAULT_WORKSPACE_PATH="/github/workspace/"
## This file forces git to keep empty folders
PLACEHOLDER_FILE=.dot-ignore
## We need an empty file to create the folders cause git does not track empty folders
PLACEHOLDER_FILE_CONTENT='#placeholder file
'
WORKSPACE_FILE_CONTENT='name: default
version: 1.0.0
description: "DO NOT ERASE ME !!! I am a marker file required by dotCMS CLI."'

_normalize() {
    in=$1
    normalized=$(echo "$in" | sed -E 's#/+#/#g')
    echo "$normalized"
}

_base_path(){
    INPUT_PATH=$1
    BASE_PATH=${INPUT_PATH:-$DEFAULT_WORKSPACE_PATH}
    BASE_PATH=$(_normalize "$BASE_PATH")
    echo "$BASE_PATH"
}

_workspace_file(){
    BASE_PATH=$1
    WORKSPACE_FILE=$BASE_PATH/$DOT_WORKSPACE_YML
    WORKSPACE_FILE=$(_normalize "$WORKSPACE_FILE")

    if [ ! -f "$WORKSPACE_FILE" ]; then
          echo "$WORKSPACE_FILE_CONTENT" >> "$WORKSPACE_FILE";
          echo "$WORKSPACE_FILE";
    fi
}

_files_path(){
    BASE_PATH=$1
    FILES_PATH=$BASE_PATH/$FILES_NAME_SPACE
    FILES_PATH=$(_normalize "$FILES_PATH")

    #echo "Files path: $FILES_PATH"
    if [ ! -d "$FILES_PATH" ]; then
          #echo "Creating files path: $FILES_PATH";
          mkdir -p "$FILES_PATH";

          WORKING_EN=$(_normalize "$FILES_PATH"/working/en-us/ )
          #echo "Working en-us path: $WORKING_EN";
          mkdir -p "$WORKING_EN";
          echo "$PLACEHOLDER_FILE_CONTENT" >> "$WORKING_EN""$PLACEHOLDER_FILE"

          LIVE_EN=$(_normalize "$FILES_PATH"/live/en-us/ )
          #echo "Live en-us path: $LIVE_EN";
          mkdir -p "$LIVE_EN";
          echo "$PLACEHOLDER_FILE_CONTENT" >> "$LIVE_EN""$PLACEHOLDER_FILE"

          echo "$FILES_PATH"
    fi
}

_content_types_path(){
    BASE_PATH=$1
    CONTENT_TYPES_PATH=$BASE_PATH/$CONTENT_TYPES_NAME_SPACE
    CONTENT_TYPES_PATH=$(_normalize "$CONTENT_TYPES_PATH")

    #echo "Content types path: $CONTENT_TYPES_PATH"
    if [ ! -d "$CONTENT_TYPES_PATH" ]; then
          #echo "Creating content types path: $CONTENT_TYPES_PATH";
          mkdir -p "$CONTENT_TYPES_PATH";
          echo "$PLACEHOLDER_FILE_CONTENT" >> "$CONTENT_TYPES_PATH""$PLACEHOLDER_FILE"
          echo "$CONTENT_TYPES_PATH"
    fi
}

_languages_path(){
    BASE_PATH=$1
    LANGUAGE_PATH=$BASE_PATH/$LANGUAGES_NAME_SPACE
    LANGUAGE_PATH=$(_normalize "$LANGUAGE_PATH")
    #echo "Languages path: $LANGUAGE_PATH"
    if [ ! -d "$LANGUAGE_PATH" ]; then
          mkdir -p "$LANGUAGE_PATH";
          echo "$PLACEHOLDER_FILE_CONTENT" >> "$LANGUAGE_PATH""$PLACEHOLDER_FILE"
          echo "$LANGUAGE_PATH"
    fi
}

_sites_path(){
    SITES_PATH=$BASE_PATH/$SITES_NAME_SPACE
    SITES_PATH=$(_normalize "$SITES_PATH")
    #echo "Sites path: $SITES_PATH"
    if [ ! -d "$SITES_PATH" ]; then
          #echo "Creating sites path: $SITES_PATH";
          mkdir -p "$SITES_PATH";
          echo "$PLACEHOLDER_FILE_CONTENT" >> "$SITES_PATH""$PLACEHOLDER_FILE"
          echo "$SITES_PATH"
    fi
}

create_workspace(){
    echo Param ::: "$1"
    BASE_PATH=$(_base_path "$1")
    echo basePath is :::  "$BASE_PATH"
    echo :: "$USER"

    workspace=$(_workspace_file "$BASE_PATH")
    echo "$workspace"

#    files=$(_files_path "$BASE_PATH")
#    contentTypes=$(_content_types_path "$BASE_PATH")
#    languages=$(_languages_path "$BASE_PATH")
#    sites=$(_sites_path "$BASE_PATH")
#
#    if [ -n "$workspace" ] && [ -n "$files" ] && [ -n "$contentTypes" ] && [ -n "$languages" ] && [ -n "$sites" ]; then
#       echo "All functions had a return value."
#    fi
}




