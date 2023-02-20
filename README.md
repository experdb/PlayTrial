# PlayTrial

### Play Trial 사용자 가이드
1. eXperDB Play Tiral Github Repo 접속 ( eXperDB Play Triial Github )

2. Add file 클릭 => Create new file(새로운 파일 생성), Upload files(파일 업로드) 택 1
![image](https://user-images.githubusercontent.com/91466343/219995676-835d753e-5afa-41bf-b2d0-b1f2f85efdee.png)


3. .md 파일 또는 .sql 파일 생성 및 업로드

4. .md 파일과 .sql 두 개의 파일 URL로 직접적으로 접속할 수 있도록 URL query string parameter 입력

  - 파일 URL 추출
    * Raw 버튼 클릭 => 해당 URL 복사
![image](https://user-images.githubusercontent.com/91466343/219995599-1cdc1811-ebd6-4f50-a6cc-4aef8f8f3568.png)
![image](https://user-images.githubusercontent.com/91466343/219995625-ad4bef59-9d9c-4dae-8462-047c637b0764.png)



  - URL query string parameter 입력
   ```
    https://www.postgres-demo.inzent.com/?sql=[sql 파일 URL]&&md=[md 파일 URL]
   ```

5. Sample URL ( Postgres in browser - Sample URL )
![image](https://user-images.githubusercontent.com/91466343/220004054-08543d74-5f48-4b80-ae44-5b5ff95640d8.png)


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
   ````
    
    1. 순서가 필요한 목록  
    - 순서가 필요하지 않은 목록  
    * 순서가 필요하지 않은 목록  
    + 순서가 필요하지 않은 목록  
