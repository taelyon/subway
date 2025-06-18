const String subwayApiKey = String.fromEnvironment(
  'SUBWAY_API_KEY',
  defaultValue: '596c69597774616536325742684e64',
);

/// API 호출에 사용할 기본 URL.
/// 환경 변수 `SUBWAY_API_BASE_URL` 로 재정의할 수 있습니다.
const String subwayApiBaseUrl = String.fromEnvironment(
  'SUBWAY_API_BASE_URL',
  defaultValue: 'https://swopenAPI.seoul.go.kr/api/subway',
);
