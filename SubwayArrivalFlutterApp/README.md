# SubwayArrivalFlutterApp

이 프로젝트는 플러터(Flutter)로 작성된 간단한 한국 지하철 도착 정보 앱 예제입니다. `http` 패키지를 사용해 서울시 열린데이터 광장 API를 호출하며, `shared_preferences`로 설정을 저장합니다.

## 주요 기능
- 설정 화면에서 지하철역과 상행/하행 방향을 선택해 저장
- 메인 화면에서 선택된 역의 실시간 도착 정보를 최대 두 대까지 표시

## 사용 방법
1. Flutter 환경을 준비합니다.
2. `pubspec.yaml`의 의존성을 설치합니다: `flutter pub get`
3. `lib/` 폴더의 소스를 플러터 프로젝트에 복사하거나 그대로 실행합니다.
4. `lib/services/api_key.dart` 파일에는 기본 API 키가 정의되어 있습니다. 실제 서비스 시에는 `--dart-define SUBWAY_API_KEY=<YOUR_KEY>` 옵션을 사용하거나 파일을 수정해 본인의 키로 교체한 후 빌드합니다.

## API 요청 형식

API 호출은 다음과 같은 경로 형식을 사용합니다.

```
https://swopenAPI.seoul.go.kr/api/subway/{KEY}/{TYPE}/{SERVICE}/{START_INDEX}/{END_INDEX}/{statnNm}
```

- `KEY`: 발급받은 인증키
- `TYPE`: 응답 형식 (`json`, `xml` 등)
- `SERVICE`: 서비스명(실시간 도착 정보는 `realtimeStationArrival`)
- `START_INDEX`, `END_INDEX`: 조회할 데이터 범위
- `statnNm`: 역 이름

`SubwayService.fetchArrivalInfo` 함수는 위 인자를 사용해 URL을 생성합니다.

실제 앱 배포 시 네트워크 오류 처리 등 추가 작업이 필요합니다.
