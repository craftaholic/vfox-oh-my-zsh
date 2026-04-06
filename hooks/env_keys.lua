--- Environment configuration for oh-my-zsh.
--- oh-my-zsh install script handles initialization out of the box,
--- so no additional environment variables are needed.
--- @param ctx table Context information
--- @field ctx.path string SDK installation directory
function PLUGIN:EnvKeys(ctx)
    return {}
end