# En enkel rapportmall för Typst

Denna rapportmall är baserad på mallen från kursen _datastrukturer och algoritmer_, vårterminen 2024.

## Hur man använder denna mall

Du kan antingen skriva din rapport med webappen [typst.app](https://typst.app/), detta är [metod 1](#metod-1-skriva-på-typstapp), eller ladda ned denna mall lokalt och kompilera din rapport med terminalprogrammet `typst` ([metod 2](#metod-2-kompilera-lokalt)).

### Metod 1: Skriva rapporten med typst.app

1. Skapa ett konto (om du inte redan har ett) på [typst.app](https://typst.app/).
2. Skapa ett nytt projekt.
3. Ladda ned denna mapp ("report") som en .zip fil och packa upp.
4. Ladda upp `main.typ`, `template.typ` `reference.yml` och karlstad-universitet-harvard.csl filen i ditt nya projekt.
5. Börja skriva din rapport i filen `main.typ`.

### Metod 2: kompilera lokalt

1. Installera `typst` CLI programmet:

    Windows, i en PowerShell terminal:

    ```pwsh
    winget install --id Typst.Typst
    ```

    macOS:

    ```zsh
    brew install typst
    ```

    För Linux, se [Repology](https://repology.org/project/typst/versions) för hur du installerar programmet pakethanteraren på din distribution.

2. Ladda ned denna mapp ("report") som en .zip-fil och extrahera på ett lämpligt ställe.
3. Börja skriva din rapport i filen `main.typ`.
4. Kompilera till en PDF med kommandot:

    ```sh
    typst compile main.typ
    ```

## Referenssystem

Denna rapportmall använder referenssystemet Harvard, men det är enkelt att byta [CSL](https://citationstyles.org/)-fil och på sätt få ett annat referenssystem.[Sök efter andra referenssystem här](https://www.zotero.org/styles).
