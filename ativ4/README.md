##RODAR NO TERMINAL DO VSCODE##

-Caso flutter esteja desatualizado 
    flutter channel master
    flutter upgrade

-Caso seja esse erro "What went wrong: Execution failed for task ':app:compileFlutterBuildDebug'. > java.lang.NullPointerException (no error message)"
    flutter clean
    flutter pub get
