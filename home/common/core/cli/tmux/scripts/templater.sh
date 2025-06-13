#!/usr/bin/env bash

PROJECT_NAME="$1"
TEMPLATE="$2"
TEMPLATE_FILE="$HOME/.config/tmux/templates/$TEMPLATE.yml"
CONFIG_FILE="$HOME/.tmuxinator/$PROJECT_NAME.yml"

# If project name and template are not provided, exit with an error
if [ -z "$PROJECT_NAME" ] || [ -z "$TEMPLATE" ]; then
    echo "Usage: $0 <project_name> <template>"
    exit 1
fi

# If the template file does not exist, exit with an error
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Template file $TEMPLATE_FILE does not exist."
    # list available templates
    echo "Available templates:"
    ls "$HOME/.config/tmux/templates/"
    exit 1
fi

# IF ~/.tmuxinator/ does not exist, create it
if [ ! -d "$HOME/.tmuxinator" ]; then
    mkdir -p "$HOME/.tmuxinator"
fi

# If config file already exists, echo a message and exit
if [ -f "$CONFIG_FILE" ]; then
    echo "Configuration file $CONFIG_FILE already exists."
    exit 1
fi

# prefix the following lines to every new config file
# name: PROJECT_NAME
# root: $PWD
echo "Creating configuration file $CONFIG_FILE from template $TEMPLATE_FILE..."
{
    echo "name: $PROJECT_NAME"
    echo "root: $PWD"
    echo ""
    cat "$TEMPLATE_FILE"
} >"$CONFIG_FILE"
