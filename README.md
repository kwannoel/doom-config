# Doom Emacs Configuration


```
# Install emacs and ripgrep through your package manager, then...
> git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
> ~/.emacs.d/bin/doom install
> git clone git@github.com:kwannoel/doom-config.git

```

# Setup neuron
https://github.com/felko/neuron-mode#appendix-doom-emacs-configuration

Copied below for convenience:

doom-emacs users can use this configuration to work with neuron-mode:

https://gist.github.com/felko/cdb3fc19b3a60db27eb3c5bd319fc479

(include those files in `.doom.d/modules/tools/neuron`)

This creates a private module that can then be enabled by inserting neuron under the :tools section of your doom! block (inside your init.el).
