import i18next from "i18next";
import { useTranslation } from "react-i18next";

export const ServicesPage = () => {

  console.log(i18next.language); // should output the current language code
  console.log(i18next.options.defaultNS); // should
  const { t } = useTranslation();

  return (
    <div><h2>{t('welcome-text')}</h2></div>
  )
}
