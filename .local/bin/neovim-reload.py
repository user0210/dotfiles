#!/usr/bin/env python3

import os

from neovim import attach


def get_all_instances():
    instances = []
    socket_dir = os.getenv('XDG_RUNTIME_DIR')

    if socket_dir is None:
        socket_dir = '/tmp'
    directory_content = os.listdir(socket_dir)
    for instance in directory_content:
        if instance.startswith('nvim'):
            instances.append(socket_dir + instance)
    return instances


def reload(instance):
    nvim = attach('socket', path=instance)

    nvim.command('source ${HOME}/.config/nvim/lua/plugins/base16.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/lualine.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/lsp.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/scrollbar.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/gitsigns.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/navic.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/context.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/nvim-tree.lua')
    nvim.command('source ${HOME}/.config/nvim/lua/plugins/bufferline.lua')


def main():
    instances = get_all_instances()

    for instance in instances:
        reload(instance)
    pass


if __name__ == '__main__':
    main()
