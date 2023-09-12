{ pkgs, ... }: {
  i18n = {
    defaultLocale = "ko_KR.UTF-8";
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ hangul ];
    };
  };
  time.timeZone = "Asia/Seoul";
}
