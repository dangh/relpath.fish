function relpath --argument-names source target --description "Print target path with relative to the source path"
  set source (builtin realpath $source)
  set target (builtin realpath $target)
  set --local base
  while test -n "$source" -a -n "$target"
    echo $source | read --local --delimiter=/ source_base source_rest
    echo $target | read --local --delimiter=/ target_base target_rest
    test "$source_base" = "$target_base" || break
    set base "$base$source_base/"
    set source "$source_rest"
    set target "$target_rest"
  end
  if test -z "$source"
    set source "."
  else
    set source (string replace --all --regex '[^/]+' '..' -- $source)
  end
  string replace --regex '/$' '' -- "$source/$target"
end
