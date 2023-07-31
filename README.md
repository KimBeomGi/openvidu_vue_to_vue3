# openvidu_vue_to_vue3

- webRTC 기술을 사용함에 있어, vue3를 이용해 openvidu를 활용해야하는 경우 SFC에 components 방식을 사용하기 위해 생성

- 해당 git project에는 오직 vue3로 변경된 front단의 내용만 생성했음.

- 추가 기능구현 한 것
  
  - 채팅
  
  - 기기 옵션 선택 및 변경
  
  - 카메라 비활성화, 음소거

- 사용방법
  
  1. [openvidu-vue - OpenVidu Docs](https://docs.openvidu.io/en/stable/tutorials/openvidu-vue/) 의 내용에 따라 기존 openvidu를 통해 진행하라고 하는 방식대로 docker 실행과 backend 단의 실행을 시켜줘야함
  
  2. 현재 git project의 폴더에서 cd frontend -> npm install -> npm run dev 순으로 실행
  
  3. 보이는 메인페이지의 webrtc를 클릭하면 진행가능

- 이는 단순 vue2로 작성되어 있는 openvidu-vue의 예제를 vue3화 시킨 것일 뿐, 그 외의 backend 및 server 구현은 각자 알아서 추가 구현해야함.