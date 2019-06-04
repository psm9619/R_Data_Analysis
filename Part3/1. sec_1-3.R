#작업용 기본 디렉토리 설정은 setwd (디렉토리 주소)
setwd ("D:\Workspace\R_data_analysis\Part3/data")

#R은 script라고 불린다. High level lang 은 크게 Compile vs. Interpret
#Compile 은 Java, C      vs.     Interpret 은 R, Python
#먼저 코딩을 하다가 Run (ctrl + Enter) 을 누르면 한 줄 씩 읽고 실행하는 방식
print (3)
print (4)

#현재 활동 working directory 주소
getwd()

#print(행동) 을 하던 그냥 행동을 명령하던 둘다 화면에 결과 출력됨
print(1+2)
1+2

#문자입력시 '' 필수. print 없이 ''로 해도 상관없음. "" 도 사용가능. 
print('a')
'a'

#이미 정해진 숫자변수 등은 이름으로 (pi 등) 쳐도 가능. pi, digits=# 으로 주면 #만큼의 소수점만 표시
print(pi)
print(pi, digits=3)

#두 수를 한 괄호안에 따옴표 등 없이 넣으면 첫번째 수 하나만 출력
#두 문자는 아예 에러
print(3,4)
#print('a', 'b')

#한 번에 여러 문자/숫자를 쓰려면 cat()을 쓸것
cat(1, ':', 'a', '\n', 5)
#여러 문자/숫자 및 자동 줄바꿈 + 더 간단함 을 하려면 ; 이용
3; 4; 5
3; 'a'; 4
1+2; pi*5*5; 'ab'




