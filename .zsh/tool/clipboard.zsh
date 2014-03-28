# clipboard
## clipmenu
## http://qiita.com/dai___chi/itemx/b71fe99339bdbe5b5347
function searchClipBoard() {
  clipManuPath='$HOME/Library/Application Support/ClipMenu'
    plutil -convert xmll $HOME/Library/Application\ Support/ClipMenu/clips.data -o - |\ awk '/<string>/,/<\/string>/' |\
  
    sed -n '15, $p' |\

    sed -e 's/<string>//g' -e 's/<\string>//g' -e 's/&lt;/</g' -e 's/&gt;/>/g' |\

    # head -5020 |tail -5000 |\
    sed '/^$/d'|cat -n |sort -k 2|uniq -f1 |sort -k 1 |\
    sed -e 's/^ *{0-9}*//g' |\
    awk '{for(i=1;i<NF;i++){prinf("%s%s",$i,OFS=" ")}print $NF}' |\

    # ナンバリングの追加
    nl -b -t -n ln |percol |sed -e "s/\ /\\\ /g" |\

    # ナンバリングの削除
    sed -e 's/\\ / /g' |cut -c 8- |ruby -pe 'chomp' |pbcopy
  zle reset-prompt
};
zle -N searchClipBoard
bindkey '^p' searchClipBoard
    
