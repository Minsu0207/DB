-- 1.<학생> 테이블에 저장되어 있는 모든 학생의 이름을 가져오는 SQL문을 작성하시오.
select 이름
from 학생;
-- 2.<교수> 테이블에 저장되어 있는 모든 교수의 이름과 전화번호를 가져오는 SQL문을 작성하시오.
select 이름,전화번호
from 교수;
-- 3.<수강신청> 테이블의 모든 내용을 가져오는 SQL문을 작성하시오.
select *
from 수강신청;
-- 4.<학생> 테이블에 저장되어 있는 학생 중 2018학년 1학기에 수강신청을 하지 않은 학생의 이름을 찾으시오
select 이름
from 학생 
where 이름 not in(
	select 학생.이름
	from 학생
    inner join 수강신청 on 학생.학번 = 수강신청.학번
	where 수강신청.연도='2018' and 수강신청.학기='1');
    

-- 5.이름이 ‘김민준’인 학생이 2018학년도 1학기에 수강 신청한 과목명을 검색하시오

-- 6.<학생> 테이블의 ‘이름’ 필드를 오름차순으로 정렬하여 출력하는 SQL문을 작성하시오.
select 이름
from 학생
order by 이름 asc;

-- 7.<학생> 테이블의 ‘시도’ 와 ‘이름’ 필드의 데이터를 가져와서 ‘시도’, ‘이름’ 순서로 오름차순으로 정렬하는 SQL문을 작성하시오
select 시도,이름
from 학생
order by 1,2;

-- 8.<학생> 테이블의 ‘시도’ 는 내림차순으로 ‘이름’ 은 오름차순으로 정렬하는 SQL문을 작성하시오
select 시도, 이름
from 학생
order by 1 desc, 2 asc;

-- 9.<학생> 테이블의 ‘시도’ 와 ‘이름’ 필드의 데이터를 가져와서 ‘시도’, ‘이름’ 순서로 내림차순으로 정렬하는 SQL문을 작성하시오
select 시도,이름
from 학생
order by 1 desc, 2 desc;

-- 10.<수강신청> 테이블에서 '학번' 필드가 '1801001'인 레코드의 '수강신청번호', '학번', '날짜'를 읽어오는 SQL문을 작성하시오.
select 수강신청번호,학번,날짜
from 수강신청
where 학번='1801001';

-- 11.<수강신청> 테이블에서 '날짜'가 '2018-01-01’ 이전에 수강 신청한 레코드의 '수강신청번호', 학번', '날짜'를 읽어오는 SQL문을 작성하시오.
select 수강신청번호, 학번, 날짜
from 수강신청
where 날짜<'2018-01-01';

-- 12 <과목> 테이블에서 '시수'가 1, 2, 3인 레코드의 '과목번호', '과목', '시수'를 읽어오는 SQL문을 작성하시오..
select 과목번호, 과목명, 시수
from 과목
where 시수 IN(1,2,3);

-- 13 <교수> 테이블에서 '전화번호' 필드(열)의 값이 없는 레코드의 '이름'과 '학과'을 읽어오는 SQL문을 작성하시오.
select 이름,학과
from 교수
where 전화번호 is null;

-- 14 <수강신청> 테이블에서 날짜가 ‘2018-01-01’와 ‘2018-07-31’ 사이 수강신청한 레코드의 ‘학번’, ‘날짜’를 읽어오는 SQL문을 작성하시오.
select 학번,날짜
from 수강신청
where 날짜 between '2018-01-01' and '2018-07-31';

-- 15 <교수> 테이블에서 '전화번호'가 있는 교수의 '이름'과 ‘전자우편', ‘전화번호’를 읽어오는 SQL문을 작성하시오.
select 이름,전자우편,전화번호
from 교수
where 전화번호 is not null;

-- 16 <수강신청> 테이블에서 '학번'이 1601001'이고 '연도'가 2016'인 데이터를 가져오는 SQL문을 작성하시오.
select *
from 수강신청
where 학번='1601001' and 연도='2016';

-- 17 <수강신청> 테이블에서 '학번'이 1601002'번과 1801002번인 학생의 수강신청 데이터를 가져오는 SQL문을 작성하시오.
select *
from 수강신청
where 학번='1601002' or 학번='1801002';

-- 18 <수강신청 > 테이블에서 '1601001'와 '1601002' 번인 학생의 '2016' 년도 수강신청 데이터를 가져오는 SQL문을 작성하시오.
select *
from 수강신청
where (학번 =1601001 or 학번 = 1601002) and 연도='2016';

-- 19 <수강신청> 테이블에서 '1601001'와 '1601002' 번인 학생의 수강신청 데이터를 가져오는 SQL문을 IN  연산자를 이용하여 작성하시오
select *
from 수강신청
where 학번 in (1601001,1601002);

-- 20 <수강신청> 테이블에서 '1601001' 학생을 제외한 모든 학생의 수강신청 데이터를 가져오는 SQL문을 작성하시오
select *
from 수강신청
where 학번 not in (1601001);

-- 21 <교수> 테이블에서 '김'씨 성을 가진 교수의 자료를 검색하는 SQL문을 작성하시오.
select *
from 교수
where 이름 like '김%';

-- 22 <학과> 테이블에서 학과 이름에 '공학'이 포함되어 있는 학과의 정보를 검색하는 SQL문을 작성하시오.
select *
from 학과
where 학과명 like '%공학%';

-- 23 <과목> 테이블에서 과목의 영문 이름이 'C'로 시작하여 e로 끝나는 과목의 '과목번호', '과목명', '영문명'을 가져오는 SQL문을 작성하시오.
select 과목번호,과목명,영문명
from 과목
where 영문명 like 'c%e';

-- 24 <학생> 테이블에서 학생 이름이 '○○준'과 같은 이름을 가진 학생의 자료를 가져오는 SQL문을 작성하시오.
select *
from 학생
where 이름 like '__준';

-- 25 <수강신청내역> 테이블에서 '과목번호'가 'K20045'이거나 'K20056'이고 평점'이 3인 레코드의 '수강신청번호', '과목번호', '평점'을 가져오는 SQL문을 작성하시오.
select 수강신청번호,과목번호,평점
from 수강신청내역
where 과목번호 IN('k20045', 'k20056') and 평점 = '3';

-- 26 <수강신청내역> 테이블에서 '과목번호'가 'K20045’, ‘K20056’, ‘Y00132' 인 과목의 '수강신청번호', '과목번호', 
-- '평점'을 가져오는 SQL문을 IN 연산자를 이용하여 작성하시오. '과목번호' 필드를 기준으로 오름차순으로 정렬하시오
select 수강신청번호, 과목번호, 평점
from 수강신청내역
where 과목번호 IN('K20045', 'K20056', 'Y00132')
order by 2 asc;

-- 27 <수강신청내역> 테이블에서 '평점'이 -1이 아닌 레코드의 자료를 가져오는 SQL문을 작성하시오.
select *
from 수강신청내역
where 평점 not in(-1);

-- 28 <학생> 테이블에서 18학번 학생들의 '학번', '이름', '시도'을 가져오는 SQL문을 작성하시오.
select 학번,이름,시도
from 학생
where 학번 like '18%';

-- 29 〈학생〉 테이블에서 주소 중에 시군구' 필드가 '구'로 끝나는 학생들의 ‘학번’, '이름', '시도', 시군구'를 가져오는 SQL문을 작성하시오.
select 학번,이름,시도,시군구
from 학생
where 시군구 like '%구';

-- 30 <과목> 테이블에서 '영문명'이 'I'로 시작하여 'n'으로 끝나는 과목의 '과목번호, ’과목명', '영문명'을 가져오는 SQL문을 작성하시오.
select 과목번호,과목명,영문명
from 과목
where 영문명 like 'I%n';

-- 31 <과목> 테이블에서 '과목명'이 ‘컴퓨터ㅇㅇ'와 같은 이름을 가진 과목의 '과목번호', '과목', '영문명'을 가져오는 SQL문을 작성하시오.
select 과목번호,과목명,영문명
from 과목
where 과목명 like '컴퓨터%';

-- 32 <학생> 테이블에서 학생의 이름에 '서'자가 들어가는 학생의 '학번', '학과'. '이름’, ‘시도'를 가져오는 SQL문을 작성하시오.
select 학번,학과,이름,시도
from 학생
where 이름 like '%서%';

-- 33 <학생> 테이블에서 '이름', '주소’, ‘시군구', '시도', '우편번호의 정보를 묶어서 아래와 같이 하나의 필드처럼
-- 보이도록 가져오는 SQL문을 작성하시오. (묶은 필드의 이름은 '학생정보'로 출력한다. '이름'으로 정렬하시오.)
select CONCAT(이름,"(",주소,시군구,시도,우편번호,")") as '학생정보'
from 학생
order by 이름 asc;

-- 34 <과목> 테이블에서 '과목명', '담당교수' 필드를 가져와서 '담당교수' 필드의 별명을 담당교수사번'으로 바꾸어 출력하는 SQL문을 작성하시오.
select 과목명,담당교수 as 담당교수사번
from 과목;

-- 35 <수강신청> 테이블에서 아래와 같이 '학번'이 '1801001'인 학생의 수강신청 자료를 출력하도록 SQL문을 작성하시오.
select *
from 수강신청
where 학번 = 1801001;

-- 36 〈학생〉 테이블에서 '학번'과 '이름', 그리고 이름 중 성씨만 가져오는 SQL문을 작성하시오.
select 학번,이름,left('이름','1')
from 학생;

-- 37 〈학생〉 테이블에서 16학번인 학생의 학번과 이름, 학년을 가져오는 SQL문을 작성하시오.
select 학번,이름,학년
from 학생
where 학번 like '16%';

-- 38 <수강신청> 테이블에서 컴퓨터정보학과가 아닌 학생의 '수강신청번호', '학번','날짜'를 가져오는 SQL문을 작성하시오.
select 수강신청번호,학번,날짜
from 수강신청;

-- 39 <수강신청> 테이블에서 2018년 3월에 수강 신청한 레코드의 '수강신청번호', 학번', '날짜'를 가져오는 SQL문을 작성하시오.
select 수강신청번호,학번,날짜
from 수강신청
where year(날짜)=2018 and month(날짜)=3;

-- 40 <수강신청내역> 테이블에서 평점이 입력되어 있는(평점'이 -1이 아닌) 레코드중 '수강신청번호', '과목번호', 
-- '평점'과 평점이 0이면 '미취득' 아니면 '취득'으로 출력하는 SQL문을 작성하시오.
select 수강신청번호 , 과목번호 ,평점, if(평점 != 0,"취득","미취득") as 취득여부
from 수강신청내역
where 평점 != -1;

-- 41 〈학생〉 테이블에서 이름'과 시도'를 하나로 묶어 필드명을 '이름'으로 읽어오는 SQL문을 작성하시오.
select concat(이름,'(',시도,')') as 이름
from 학생;

-- 42 <과목> 테이블에서 ‘담당교수'와 '과목명'을 국문과 영문으로 읽어오는 SQL문을작성하시오.
select 담당교수, concat(과목명,'(',영문명,')') as 과목명
from 과목;

-- 43 <과목> 테이블에서 '과목명'과 화점', 그리고 한 화기를 15주라 가정했을 때 한 학기 총 수업 시간 수를 읽어오는 SQL문을 작성하시오.
select 과목명,학점, 시수*15 as 총수업시간
from 과목	
order by 1;

-- 44 <학생> 테이블에서 '학번'과 이름에서 성씨(last name)를 뺀 이름(first name)을 출력하는 SQL문을 작성하시오.
select 학번,  SUBSTRING(이름,2,3)
from 학생;

-- 45 <수강신청> 테이블에서 3월 1일 수강 신청한 데이터의 '학번'과 '날짜'를 출력하는 SQL문을 작성하시오
select 학번,날짜
from 수강신청
where MONTH(날짜)=3 and Day(날짜)=1;

-- 46 <학생> 테이블에서 아래 그림과 같이 '학번', '이름', 학과'와 컴퓨터정보학과인지 다른 학과인지를 출력하는 SQL문을 작성하시오.
select 학번, 이름, 학과, if(b.학과명='컴퓨터정보학과', '컴퓨터정보학과','타과') as 비고
from 학생 a,  학과 b
where a.학과=b.학과번호;


select s.학번, s.이름, s.학과,
   case when 학과명 = '컴퓨터정보학과' then c.학과명
      else '타과'
   end 비고
from 학생 s, 학과 c
where s.학과 = c.학과번호;

-- 47 〈수강신청내역〉 테이블에서 전체 행의 수(레코드의 수)를 계산하는 SQL문을 작성하시오
select count(*)
from 수강신청내역;

-- 48 〈수강신청내역〉 테이블에서 '수강신청번호'가 '1810002'인 수강신청 레코드의 수를 계산하는 SQL문을 작성하시오.
select count(*)
from 수강신청내역
where 수강신청번호='1810002';

-- 49 <교수> 테이블에서 '전화번호'가 저장되어있는 교수의 수를 계산하는 SQL문을 작성하시오.
select count(*)
from 교수
where 전화번호 is not null;

-- 50 <과목> 테이블에서 전체 과목의 학점의 평균과 합을 구하는 SQL문을 작성하시오.
select avg(학점) as 평균학점, sum(학점) as 총학점
from 과목;

-- 51 <과목> 테이블의 과목 중에 최대 학점과 최소 학점을 구하는 SQL문을 작성하시오.
select max(학점) as 최대학점, min(학점) as 최소학점
from 과목;

-- 52 〈수강신청내역> 테이블에서 수강 신청한 서로 다른 과목의 수가 몇 과목인지를 구하는 SQL문을 작성하시오
select count(distinct 과목번호) as 과목수 
from 수강신청내역;

-- 53 <수강신청> 테이블에서 수강 신청한 학생이 몇 명인지를 구하는 SQL문을 작성하시오.
select count(distinct 학번) as 학생수
from 수강신청;

-- 54 〈수강신청내역> 테이블에서 '수강신청번호' '1810001'의 신청 과목 수와 평균 평점을 구하는 SQL문을 작성하시오.
select count(*) as 과목수 , avg(평점) as 평균평점
from 수강신청내역
where 수강신청번호='1810001';

-- 55 <수강신청내역> 테이블에서 아래와 같이 과목별로 수강자수를 읽어오는(과목번호, 수강자 수) SQL문을 작성하시오.
select 과목번호, count(*) as 수강자수
from 수강신청내역
group by 과목번호
order by 1;

-- 56 위의 문제에서 '평점'이 - 1 인 과목은 제외하고 출력하도록 필터링하시오
select 과목번호, count(*) as 수강자수
from 수강신청내역
where 평점 != -1
group by 과목번호
order by 1;

-- 57 위의 문제에서 과목별 평균 평점을 출력하시오
select 과목번호, count(*) as 수강자수, avg(평점) 
from 수강신청내역
where 평점 != -1
group by 과목번호;

-- 58 위의 문제에서 수강자 수가 4 명 이상인 과목만을 출력하도록 필터링하시오
select 과목번호, count(*) as 수강자수, avg(평점) 
from 수강신청내역
where 평점 != -1
group by 과목번호
having COUNT(*) >=4;

-- 59 위의 문제에서 평균평점을 기준으로 오름차순으로 정렬하시오.
select 과목번호, count(*) as 수강자수, avg(평점) 
from 수강신청내역
where 평점 != -1
group by 과목번호
having COUNT(*) >=4
order by 3 asc;

-- 60 <수강신청내역> 테이블에서 아래와 같이 '수강신청번호별로 수강과목 수와 평균평점을 출력하시오. (단, 수강과목 수가 3 이상인 것만 출력하고 평균평점에 대하여 내림차순으로 정렬하시오)
select 수강신청번호, count(*) as 수강과목수, avg(평점)
from 수강신청내역
group by 수강신청번호
having COUNT(*) >=3
order by 3 desc;