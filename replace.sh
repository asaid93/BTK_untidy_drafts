sed 's/boot/boot:/' output.txt | awk -F": " '
{ 
    for (i=1; i<=NF; i++)  {a[NR,i] = $i}
}
NF>p { p = NF }
END { for(j=1; j<=p; j++) {
        str=a[1,j]
        for(i=2; i<=NR; i++) {str=str"\t\t"a[i,j];} print str}
}' | column -s $'\t' -t
