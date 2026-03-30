function shrekfetch --wraps='fastfetch -l Pictures/shrek.jpg --logo-type sixel --logo-width 30' --description 'alias shrekfetch fastfetch -l Pictures/shrek.jpg --logo-type sixel --logo-width 30'
    fastfetch -l Pictures/shrek.jpg --logo-type sixel --logo-width 30 $argv
end
