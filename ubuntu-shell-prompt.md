Dziwnie wyglądający, długi ciąg w konsoli (...;machineid=...;user=...;bootid=...) to wynik funkcji OSC 3008 (Hierarchical Context Signalling) wprowadzonej przez systemd. Skrypt /etc/profile.d/80-systemd-osc-context.sh przekazuje metadane sesji (użytkownik, machineid, bootid, cwd) do emulatora terminala. Jeśli Twój terminal (np. starszy klient SSH, Emacs, SecureCRT lub specyficzny pager) nie obsługuje tych kodów escape, wyświetla je wprost w wierszu poleceń.

1. Zablokowanie tworzenia pliku przez systemd-tmpfiles:
Utwórz pusty plik konfiguracyjny w /etc/tmpfiles.d/, aby zapobiec odtwarzaniu skryptu przez systemd:bash
```
sudo touch /etc/tmpfiles.d/20-systemd-osc-context.conf
```

2. Usunięcie skryptu z profile.d:bash
```
sudo rm /etc/profile.d/80-systemd-osc-context.sh
```
Używaj kodu z rozwagą.
(Po wykonaniu tych dwóch kroków system nie będzie ponownie generował ani dołączał tego skryptu przy aktualizacjach).

3. Alternatywnie (tymczasowo dla pojedynczej sesji lub użytkownika):
Możesz wyczyścić zmienne sterujące w pliku ~/.bashrc:bash
```
unset PS0 PROMPT_COMMAND
```
