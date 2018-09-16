#!/bin/bash
# source /home/jinmao/.bashrc
cd $(dirname $0)

content=$(cat create-secret)
secret_content="**爱你**"

css_file=../../pandoc.css

ls | grep -v create | xargs -i rm {}

md_file=$(mktemp XXXXXX.md)
html_file=${md_file%md}html
first_html_file=$html_file

for title in $content;do
    new_md_file=$(mktemp XXXXXX.md)
    new_html_file=${new_md_file%md}html
    echo "["$title"]("$new_html_file")" > $md_file
    last_md_file=$md_file
    md_file=$new_md_file
done

echo "["$title"]("$first_html_file")" > $last_md_file
rm $md_file

# create all md successful

# ls | grep -v create | xargs -i md2html {}
mds=$(ls | grep -v create)

for md in $mds;do
    name=${md%md}
    pandoc --standalone --self-contained --css $css_file ${name}md > ${name}html
done
# md2html finished
# echo "first html:$first_html_file"

last_html_file=${last_md_file%md}html
contents=$(cat $last_html_file)
content=""
for t in $contents;do
    content=$content" $t"
done

end="</body> </html>"
secret='<!--<p><a href=../secret/secret-about-u.html>answer</a></p>--> '$end
content=${content//$end/$secret}

echo $content > $last_html_file
# add secret link finished
# echo "last html:$last_html_file"
# <a href="7ZaWVU.html">7</a>
# echo $last_html_file
# echo $content


echo "# 欢迎偷看我的秘密" > ../index.md
echo "**坚持下去就一定会有收获**" >> ../index.md
echo "" >> ../index.md
echo "[你确定你想看这个秘密么](./secrets/$first_html_file)" >> ../index.md

pandoc --standalone --self-contained --css $css_file ../index.md > ../index.html

# create index.html finished

echo "$secret_content" > ../secret-about-u.md
pandoc --standalone --self-contained --css $css_file ../secret-about-u.md > ../secret-about-u.html

# secret content

