# suppress stopping on thread termination signals, but show
# (UniBone threads)
handle SIG32 nostop pass

define asan
    break __sanitizer::Die
end
