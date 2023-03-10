# PlayTrial

### Play Trial 사용자 가이드
1. eXperDB Play Tiral Github Repo 접속 ( [PLAY TRIAL GITHUB](https://github.com/experdb/PlayTrial)   )

2. Sample URL ( [SAMPLE URL](https://www.postgres-demo.inzent.com/?sql=https://raw.githubusercontent.com/experdb/PlayTrial/main/sample.sql&&md=https://raw.githubusercontent.com/experdb/PlayTrial/main/sample.md) - Sample URL )  
![image](https://user-images.githubusercontent.com/91466343/221457316-1bbdb848-1206-4222-b285-2b7591a8f31d.png)  



3. Add file 클릭 => `Create new file`(새로운 파일 생성), `Upload files`(파일 업로드) 택 1
![image](https://user-images.githubusercontent.com/91466343/221455708-56216caa-16c4-4f56-8037-d9a6976c4aed.png)  


4. `.md` 파일 또는 `.sql` 파일 생성 및 업로드  
  
  ```
  .md 파일 작성시
  코드 tag 하나당 해당 button 생성
  매개변수는 0, 1, 2 ... code tag에 맞춰서 넣어줄 것
  
  <button onclick="copyCode(0)">copy</button>   <!-- Button tag, 매개변수만 변경하여 그대로 작성 -->
    ```sql                                      <!-- code tag 작성 -->
    SELECT first_name, last_name FROM employees;  
    ```
 ```  
 
 4-1 이미지 파일 업로드
 
  4-1-1. Update Files 클릭  
    ![image](https://user-images.githubusercontent.com/91466343/221458257-fc3ab3b4-ef2b-406e-9a41-e6e90deeb513.png)  
    
    
  4-1-2. 원하는 이미지 사진 업로드  
    ![image](https://user-images.githubusercontent.com/91466343/221460063-9270c040-0849-42e2-a676-94fce771de7d.png)  
    
    
  4-1-3. 이미지의 경로를 복사하여 md 파일에 경로 추가  
    ![image](https://user-images.githubusercontent.com/91466343/221458628-22307e10-15cb-4788-ba9c-61278a1f6a9b.png)  
    
    ```
      markdown 파일에 이미지 경로 추가하는 방법
      ![image](복사한 이미지 경로)
    ```


5. `.md` 파일과 `.sql` 두 개의 파일 URL로 직접적으로 접속할 수 있도록 URL query string parameter 입력

  - 파일 URL 추출
    * `Raw` 버튼 클릭 => 해당 URL 복사
![image](https://user-images.githubusercontent.com/91466343/221455887-9bf862db-b5b2-4fe8-9e2d-a4e5f07affbb.png)  
![image](https://user-images.githubusercontent.com/91466343/221456842-f3026166-a2bd-441e-8419-921bad0ad591.png)


  - URL query string parameter 입력
   ```
    https://www.postgres-demo.inzent.com/?sql=[sql 파일 URL]&&md=[md 파일 URL]
   ```

----
### Markdown 파일 작성법
#### - Header
  ```
  # 제목1
  ## 제목2
  ### 제목3
  #### 제목4
  ##### 제목5
  ###### 제목6
  ```
  # 제목1
  ## 제목2
  ### 제목3
  #### 제목4
  ##### 제목5
  ###### 제목6
  
  ```
  * 제목1과 제목2의 또 다른 작성법
  제목1
  =====
  
  제목2
  -----
  ```
  
  #### - Emphasis
  ```
    이델릭체: *별표* or _언더바_
    두껍게: **별표** or __언더바__
    취소선: ~~물결표시~~
  ```
  
  *이델릭체*  
  **두껍게**   
  ~~취소선~~  

  #### - List
  ```
    1. 순서가 필요한 목록
    - 순서가 필요하지 않은 목록
    * 순서가 필요하지 않은 목록
    + 순서가 필요하지 않은 목록
  ```
    
  1. 순서가 필요한 목록  
  - 순서가 필요하지 않은 목록  
  
  #### - Links
  ```
    [GOOGLE](https://www.google.com)
    [NAVER](https://naver.com "링크 설명 작성")
    
    다음과 같이 문서 내 일반 URL이나 꺾쇠 괄호(`< >`, Angle Brackets)안의 URL은 자동으로 링크 사용
    구글 홈페이지: https://google.com
    네이버 홈페이지: <https://naver.com>
  ```
    
  [GOOGLE](https://google.com)  
  [NAVER](https://naver.com "링크 설명 작성")  
  구글 홈페이지: https://google.com
  
  #### - Images
  ```
    ![대체 텍스트](http://www.gstatic.com/webp/gallery/5.jpg "링크 설명 작성")
    
    ![대체텍스트][logo]
    [logo]: http://www.gstatic.com/webp/gallery/2.jpg "test"
    
    이미지에 링크
    [![test](http://www.gstatic.com/webp/gallery/2.jpg)](https://google.com)
  ```
       
  ![Test](http://www.gstatic.com/webp/gallery/2.jpg "test!!")  
  
  [![Test2][tree]](https://google.com)
  
  [tree]: https://www.gstatic.com/webp/gallery/4.jpg "test2!!"
  
  #### - 강조
  ```
    `강조할 단어`
    ```[코드 종류: html, css, javascript, bash, python etc]
      블록 강조
    ```
  ```
  
   `강조 Test`  
   ```html
   <a href="https://www.google.co.kr/" target="_blank">GOOGLE</a>
   ```  
   ```javascript
   function func() {
    var a = 'AAA';
    return a;
   }
   ```
   
  #### - Table
  ```
    헤더 셀을 구분할 때 3개 이상의 - 기호가 필요
    헤더 셀을 구분하면서 : 기호로 열 안에 내용 정렬 가능
    가장 좌측과 우측에 있는 : 기호는 생략 가능
    | 1 | 2 | 3 |
    |---|:---:|---:|
    |`a`|`b`|`c`|
    
    --: 우측정렬
    :-- 좌측정렬
    :--: 가운데 정렬
  ```

  | 값 | 의미 | 기본값 |
  |---|:---:|---:|
  | `static` | 유형(기준) 없음 / 배치 불가능 | `static` |
  | `relative` | 요소 자신을 기준으로 배치 |  |
  | `absolute` | 위치 상 부모(조상)요소를 기준으로 배치 |  |
  | `fixed` | 브라우저 창을 기준으로 배치 |  |
  
  #### - Block Quote
  ```
    > 인용문 Test
    >> 중첩된 인용문 Test
    >>> 중중첩된 인용문 Test
  ```
  
  > 남의 말이나 글에서 직접 또는 간접으로 따온 문장.  
  > (네이버 국어 사전)
  
  > 인용문
  >> 중첩된 인용문  
  >>> 중중첩된 인용문1  
  >>> 중중첩된 인용문2  
  
  #### - Raw HTML
  ```
    마크다운 문법이 아닌 원시 HTML 문법 사용 가능
  ```
  
  <img width="150" src="http://www.gstatic.com/webp/gallery/4.jpg" alt="Prunus" title="A Wild Cherry (Prunus avium) in flower">

  #### - Line Breaks
  ```
    동해물과 백두산이 마르고 닳도록 
    하느님이 보우하사 우리나라 만세   <!--띄어쓰기 2번-->
    무궁화 삼천리 화려 강산<br>
    대한 사람 대한으로 길이 보전하세
  ```
  
  동해물과 백두산이 마르고 닳도록  
  하느님이 보우하사 우리나라 만세   
  무궁화 삼천리 화려 강산<br>
  대한 사람 대한으로 길이 보전하세
  
