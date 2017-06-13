$src = (Get-Item -Path ".\" -Verbose).FullName + "\.emacs.d"
$dst = "$env:USERPROFILE\.emacs.d"

rm -Force -Recurse $dst
cp -r -fo $src $dst