$src = (Get-Item -Path ".\" -Verbose).FullName + "\.emacs.d"
$dst = "$env:USERPROFILE\.emacs.d"

copy $src $dst -recurse