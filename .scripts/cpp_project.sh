proj_dir=$PWD

echo $proj_dir

opt="N"
while echo "Create cpp project in $proj_dir?[yN]: "
do
    read opt
    if [ -e $opt  ] || [ $opt == 'n' ] || [ $opt == 'N' ]; then
        exit 0
    fi
    if [ $opt == 'y' ] || [ $opt == 'Y' ]; then
        break
    fi
done

mkdir -p "$proj_dir/include"
mkdir -p "$proj_dir/src"
mkdir -p "$proj_dir/examples"
mkdir -p "$proj_dir/bin"
touch "$proj_dir/compile_flags.txt"
echo  '-I./include' >> "$proj_dir/compile_flags.txt"
cp $HOME/.scripts/templates/cpp_Makefile "$proj_dir/Makefile"
cp $HOME/.scripts/templates/.clang-format $proj_dir
