#정규표현식
char <- c ('apple', 'Apple', 'APPLE', 'banana', 'grape')
grep ('apple', char)

char2 <- c('apple', 'banana')
grep(char2, char)
grep(paste(char2, collapse=';'), char, value=T)

grep('pp', char)
grep('pp', char, value = T) #value=T -> full word returned

grep('^A', char, value=T) #capital letter A 포함

char2 <- c('grape1', 'apple1', 'apple', 'orange', 'Apple')
grep ('ap', char2, value=T)
grep ('[1-4]', char2, value=T) 

nchar('박수nm')

paste('박', 'soo', '민')  # stringr 패키지의 str_c 와 같은 역할
paste('박', 'soo', '민', sep='.') # default 로 ' '스페이스가 들어가는데, sep='XX' 식으로 본인이 지정가능
paste('박', 'soo', '\'민') # '\' ..' 는 작은 따옴표




















