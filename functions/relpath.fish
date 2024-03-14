function relpath -a source target -d "Print target path with relative to the source path"
    set source (builtin realpath $source)
    set target (builtin realpath $target)
    set -l base
    while test -n "$source" -a -n "$target"
        echo $source | read -l -d / source_base source_rest
        echo $target | read -l -d / target_base target_rest
        test "$source_base" = "$target_base" || break
        set base "$base$source_base/"
        set source "$source_rest"
        set target "$target_rest"
    end
    if test -z "$source"
        set source "."
    else
        set source (string replace -a -r '[^/]+' '..' -- $source)
    end
    string replace -r '/$' '' -- "$source/$target"
end
