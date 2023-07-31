# openvidu_vue_to_vue3

- webRTC 기술을 사용함에 있어, vue3를 이용해 openvidu를 활용해야하는 경우 SFC와 components 방식을 사용하기 위해 생성

- 해당 git project에는 오직 vue3로 변경된 front단의 내용만 생성했음.

- 추가 기능구현 한 것
  
  - 채팅
  
  - 기기 옵션 선택 및 변경
  
  - 카메라 비활성화, 음소거

- 사용방법
  
  1. [openvidu-vue - OpenVidu Docs](https://docs.openvidu.io/en/stable/tutorials/openvidu-vue/) 의 내용에 따라 기존 openvidu를 통해 진행하라고 하는 방식대로 docker 실행과 backend 단의 실행을 시켜줘야함
     
     1. 이는 [openvidu-vue - OpenVidu Docs](https://docs.openvidu.io/en/stable/tutorials/openvidu-vue/) 통해 확인할 수 있는 https://github.com/OpenVidu/openvidu-tutorials.git 해당 git에 있는 폴더 및 파일을 가지고 진행해야함
  
  2. 1이 완료후, openvidu_vue_to_vue3 즉, 현재 git project의 폴더를 다운받고 해당 폴더에서 cd frontend -> npm install -> npm run dev 순으로 실행
     
     1. Local:   http://localhost:5173/ 로 들어갈 수 있게 됨
  
  3. 보이는 메인페이지의 webrtc를 클릭하면 진행가능
  
  

- 참고사항
  
  - views의 AppView.vue, components의 OvVideo.vue, UserVideo.vue 파일이 해당 주요 코드파일임.
  
  - 이는 단순 vue2로 작성되어 있는 openvidu-vue의 예제를 vue3화 시킨 것일 뿐, 그 외의 backend 및 server 구현은 각자 알아서 추가 구현해야함.
  
  - 또한 예제를 단순 vue3화 한 것일 뿐이기에 front 단의 추가 구현 또한 각자 알아서 추가 구현해야함.
  
  - 기존 openvidu-vue 예제를 보게되면 docker 폴더가 있을 텐데, 이건 openvidu가 배포를 위해 가지고 있는 폴더일 뿐, 우리가 직접 개발을 할 때는 반드시 가지고 있을 필요가 없음. 이유는 배포는 각자 알아서 할 테니까, 우리가 필요한 것 코드일 뿐이기 때문.
    
    - 코드에서 const mySessionId으로 되어있는 것은 방 제목을 생각하면 됨
    
    - 코드에서 const myUserName으로 되어있는 것은 내 닉네임 정도로 생각하면 됨
  
  - 각자 입맛에 맞게 또는 필요없는 부분은 알아서 수정 및 구현 하면 되겠음.