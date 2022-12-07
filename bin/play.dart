import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  Map<String, String> lang = {
    "income": "收入",
    "expenditure": "支出",
    "category": "分類",
    "tag": "標籤",
    "budget": "預算",
    "setting": "設定",
    "expand": "展開",
    "icon": "圖示",
    "color": "顏色",
    "categoryName": "分類名稱",
    "pleaseEnterName": "請輸入名稱",
    "add": "新增",
    "edit": "編輯",
    "amount": "金額",
    "note": "註記",
    "save": "儲存",
    "time": "時間",
    "date": "日期",
    "selectDay": "選擇日期",
    "selectTime": "選擇時間",
    "cancel": "取消",
    "ok": "確認",
    "notSelectCategory": "未選擇分類",
    "notFillAmount": "未填寫金額",
    "notify": "通知",
    "deleteCheck": "是否要刪除？",
    "addSuccess": "加入成功！",
    "errorFormat": "格式錯誤",
    "cantBe0": "金額不得為0",
    "editSuccess": "編輯成功！",
    "today": "今天",
    "yesterday": "昨天",
    "thisWeek": "這週",
    "thisMonth": "這個月",
    "thisYear": "今年",
    "customize": "自訂...",
    "inAndOut": "固定收支與預算",
    "noBudget": "未設定預算",
    "setBudget": "設定預算",
    "clickSetBudget": "點此設定預算",
    "noRecord": "沒有紀錄",
    "eachMonth": "每個月",
    "longBefore": "...之前",
    "before": "前",
    "save1": "存",
    "start": "開始",
    "to": "至",
    "notFillStartTime": "請選擇開始時間",
    "notFillEndTime": "請選擇結束時間",
    "endBeforeStart": "結束時間不得早於開始時間",
    "amountFormatError": "金額格式錯誤",
    "day": "天",
    "month": "月",
    "year": "年",
    "balance": "結餘",
    "total": "總共",
    "budgetLeft": "預算餘額",
    "fixedIncome": "固定收支",
    "period": "週期",
    "eachDay": "每天",
    "eachYear": "每年",
    "oClock": "點",
    "unCategory": "未分類",
    "toUnCategory": "您的帳本中有使用此分類的紀錄，若刪除此分類該項目會被歸為'未分類'",
    "showRecord": "查看項目",
    "all": "全部",
    "noTag": "無標籤",
    "timeScale": "時間尺度",
    "dataType": "資料來源",
    "inOut": "收支",
    "filter": "篩選",
    "plzChooseTime": "請選擇時間",
    "chart": "圖表",
    "login": "登入",
    "backup": "備份",
    "backupTime": "備份時間",
    "none": "無",
    "download": "下載",
    "logout": "登出",
    "overwriteInfo": "您的資料將會被覆蓋且無法復原，是否要繼續?",
    "googleDriveInfo":
        "我們將會使用您的google drive儲存您的帳本資料，在備份完成後將會在您的google drive生成\"accountingData.act\"檔案，請勿修改或移動該檔案，以確保備份功能正常，若需移除備份資料，需要將檔案完全刪除(包括垃圾桶內文件)",
    "notification": "提醒",
    "repeat": "重複",
    "monday": "星期一",
    "tuesday": "星期二",
    "wednesday": "星期三",
    "thursday": "星期四",
    "friday": "星期五",
    "saturday": "星期六",
    "sunday": "星期日",
    "mon": "週一",
    "tue": "週二",
    "wed": "週三",
    "thu": "週四",
    "fri": "週五",
    "sat": "週六",
    "sun": "週日",
    "slang1": "省一分錢就是賺一分錢",
    "slang2": "存錢以備不時之需",
    "slang3": "金錢來之不易",
    "savingNow": "現在就開始記帳吧!",
    "exportExcel": "匯出Excel",
    "startExport": "開始匯出",
    "exporting": "匯出中",
    "exportInfo": "將您的帳本匯出為Excel",
    "finishExport": "匯出完成",
    "share": "分享",
    "finishExportInfo": "請至手機儲存空間的\"下載\"查看匯出的檔案，或點擊\"分享\"將您的檔案分享至您的群組或雲端",
    "feedback": "意見回饋",
    "feedbackType": "請選擇您要回報的類型",
    "explainFeedback": "請說明您的問題或回饋",
    "yorContent": "您的內容",
    "typeEmpty": "請輸入類型",
    "contentEmpty": "請輸入內容",
    "send": "送出",
    "enter": "請輸入...",
    "recommendation": "改善建議",
    "errorReport": "錯誤回報",
    "usageProblem": "使用問題",
    "other": "其他...",
    "yourName": "您的暱稱",
    "yourEmail": "您的E-mail",
    "removeAd": "移除廣告",
    "removeAdInfo":
        "我們希望可以在不影響APP正常使用的狀態下進行一定程度的廣告投放，用以維持基本的收益。若您覺得廣告令人厭煩，您可以選擇購買去除廣告的方案，這同時也是對我們的支持，若您仍覺得有不合理或其他建議，歡迎使用\"意見回饋\"反映。",
    "subscription": "訂閱",
    "subscribing": "訂閱中",
    "backupInfo": "您的雲端資料將會被覆蓋且無法復原，是否要繼續?",
    "uploadSuccess": "上傳成功",
    "downloadSuccess": "下載成功",
    "error": "發生錯誤",
    "report": "回報",
    "unSubscribe": "取消訂閱",
    "updateInfo": "更新資訊",
    "update": "更新",
    "newVersion": "有新的版本",
    "more": "更多",
    "fixedInfo": "固定收支將會在您設定的日期或時間自動加入您的帳本，您將不需再手動加入固定的收支。",
    "selectIcon": "請選擇圖案",
    "categoryTutorial": "長按並拖動可以變更順序",
    "appWidgetShow": "\"小工具\"可以您的主螢幕顯示您的收支，方便您管理財務，是否查看教學?",
    "showMeNow": "立即查看",
    "understand": "了解了!",
    "widgets": "小工具"
  };

  List<String> keyList = [];
  List<String> valueList = [];
  lang.forEach((key, value) {
    keyList.add(key);
    valueList.add(value);
  });
  print(valueList);

  String raw =
      'Income@Expenditure@Category@Tag@Budget@Setting@Expand@Icon@Color@CategoryName@Please Enter Name@Add@Edit@Amount@Note@Save@Time@Date@Select Date@Select Time@Cancel@Confirm @ No category 선택됨 @ ​​채워지지 않은 수량 @ 주의사항 @ 삭제하시겠습니까? @ 성공적으로 가입했습니다! @ 형식 오류 @ 금액은 0이 될 수 없습니다. @ 편집에 성공했습니다! @ 오늘 @ 어제 @ 이번 주 @ 이번 달 @ 올해 @ 맞춤 … @ 완료 및 예산 @ 예산 설정 @ 예산 설정 @ 예산을 설정하려면 여기를 클릭 @ 기록 없음 @ 매월 @ ... 이전 @ 이전 @ 저장 @ 시작 @ 받는 사람 @ 시작 시간을 선택하십시오 @ 종료 시간을 선택하십시오 @ 종료 시간은 시작 시간보다 빠를 수 없습니다 @ 금액 형식 오류 @ 일 @ 개월 @ 년 @ 잔액 @ 합계 @ 예산 잔액 @ 고정 수입 및 지출 @ 기간 @ 매일 @ 매일 연 @ 시점 @ 미분류 @ 가계부에 해당 항목을 사용한 기록이 있습니다 이 항목을 삭제하면 항목이 "미분류"로 분류됩니다 @ 항목 보기 @ 전체 @ 미분류 @ 시간 척도 @ 데이터 소스 @ 수익 및 지출 @ 필터 @ 시간을 선택하십시오 @ 차트 @ 로그인 @ 백업 @ 백업 시간 @ 없음 @ 다운로드 @ 로그아웃 @ 데이터를 덮어쓰게 되며 복구할 수 없습니다. 계속하시겠습니까? @ Google 드라이브를 사용하여 데이터를 저장합니다. 회계 데이터는 백업 완료 후 구글 드라이브에 "accountingData.act" 파일이 생성됩니다. 정상적인 백업 기능을 위해 이 파일을 수정하거나 이동하지 마세요. 백업 데이터를 제거해야 하는 경우, 파일을 완전히 삭제해야 합니다(휴지통에 파일 포함) @ 알림 @ 반복 @ 월요일 @ 화요일 @ 수요일 @ 목요일 @ 금요일 @ 토요일 @ 일요일 @ 월요일 @ 화요일 @ 수요일 @ 목요일 @ 금요일 @ 토요일 @ 일요일 @ 한 푼도 아끼지 마세요 한 푼 벌기 @ 비오는날 돈모으기 @ 돈벌기 힘들어 @ 지금 회계 시작하세요! @ 엑셀 내보내기 @ 내보내기 시작 @ 내보내기 진행중 @ 장부를 엑셀로 내보내기 @ 교환 완료@공유@ "로 가주세요. 내보낸 파일을 보려면 휴대전화의 저장 공간에 있는 다운로드"를 클릭하거나 그룹 또는 클라우드에 파일을 공유하려면 "공유"를 클릭하십시오. @ 피드백 @ 원하는 피드백 유형을 선택하십시오 @ 문제 또는 피드백을 설명하십시오@ 내용@입력해 주세요 type@입력해 주세요 content@send@입력해 주세요...@개선제안@버그신고@사용문제@기타...@귀하의 닉네임@귀하의 이메일@광고제거@ 기본 소득을 유지하기 위해 앱의 정상적인 사용에 영향을 미치지 않고 광고를 실행할 수 있습니다. 광고가 거슬린다면 광고제거 플랜 구매를 선택하실 수 있으며, 이는 저희의 지원이기도 합니다.여전히 불합리하거나 기타 제안사항이 있다고 생각되시면 "피드백"을 이용하여 반영해 주시기 바랍니다. @ SUBSCRIBE @ SUBSCRIBE @ 클라우드 데이터를 덮어쓰게 되어 복구할 수 없으니 계속하시겠습니까 @ 업로드 성공 @ 다운로드 성공 @ 오류 발생 @ 신고 @ 구독 취소 @ 업데이트 정보 @ 업데이트 @ 새 버전이 있습니다 @ 더보기 @ 수정됨 수입과 지출은 설정한 날짜와 시간에 자동으로 장부에 추가되므로 더 이상 고정 수입과 지출을 수동으로 추가할 필요가 없습니다. @ 패턴을 선택하세요 @ 길게 누르고 드래그하여 순서를 변경하세요 @ "위젯"은 홈 화면에 수입과 지출을 표시할 수 있어 재정 관리에 편리합니다. 튜토리얼을 보시겠습니까? @ 지금 보기 @ 알았어요!';
  List<String> spl = raw.split('@');

  Map<String, String> translated = {};
  print(keyList.length);
  print(spl.length);

  String locale = 'es';

  for (var element in keyList) {
    http.Response response = await http.post(Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?target=$locale&source=zh_TW&key=AIzaSyAfMCU3TlhXwcxO5SNnbccZAr-6bq3NFGw&q=${lang[element]}'));
    lang[element] =
        jsonDecode(response.body)['data']['translations'][0]['translatedText'];
  }

  // for (int i = 0; i < keyList.length; i++) {
  //   translated.addAll({keyList[i]: spl[i]});
  // }
  print(jsonEncode(lang));
}
