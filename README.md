# Sistem Numeric pe FPGA cu Mouse

Acest proiect implementează un sistem numeric pe FPGA care permite contorizarea click-urilor mouse-ului și afișarea numărului pe 4 afișaje cu 7 segmente (SSD). Sistemul oferă funcționalități precum incrementare, decrementare, resetare și inversarea funcționalităților butoanelor mouse-ului.

## Scopul Proiectului

Proiectul își propune să ofere un exemplu educațional de utilizare a FPGA-urilor pentru gestionarea interfețelor hardware (mouse) și pentru implementarea unui sistem numeric complet.

## Funcționalități

- **Incrementare**: Click stânga incrementează numărul afișat.
- **Decrementare**: Click dreapta decrementează numărul afișat.
- **Resetare**: Buton dedicat pentru resetarea numărătorii la `0000`.
- **Reversibilitate**: Switch pentru inversarea funcțiilor butoanelor mouse-ului.
- **Afișare pe SSD**: Numărul curent este afișat pe 4 SSD-uri conectate la FPGA.
- **Rotire**: Numărătoarea revine la `0000` după atingerea valorii maxime (`9999`) sau sare la `9999` când se încearcă decrementarea de la `0000`.

## Arhitectura Sistemului

Sistemul este alcătuit din:
1. **Unitatea de Control (UC)**:
   - Interpretează semnalele de la mouse.
   - Gestionează funcționalitatea de resetare și inversare.
2. **Unitatea de Execuție (UE)**:
   - Efectuează operațiile de incrementare/decrementare.
   - Controlează afișarea pe SSD.

### Componente Tehnice

- **Mouse PS/2**: Comunică cu FPGA folosind protocolul PS/2 (33 biți per pachet).
- **Placă FPGA**: Recomandat Basys3 (XC7A35T-1CPG236C), dar proiectul poate fi adaptat pentru alte modele.
- **Afișaj cu 7 segmente (SSD)**: 4 unități pentru afișarea numărului curent.

### Intrări și Ieșiri

| Intrare          | Descriere                           |
|-------------------|-------------------------------------|
| `clk`            | Semnal de ceas al sistemului        |
| `reset`          | Resetare numărătoare               |
| `revers`         | Inversare funcții mouse             |
| `usb_clk`        | Semnal de ceas PS/2                |
| `usb_data`       | Date primite de la mouse           |

| Ieșire           | Descriere                           |
|-------------------|-------------------------------------|
| `anozii`         | Control pentru activarea SSD        |
| `catozi`         | Semnal pentru cifrele afișate       |
| `is_left`        | Modul de funcționare al mouse-ului  |

## Utilizare

1. **Materiale necesare**:
   - Placă FPGA (Basys3 sau compatibilă).
   - Mouse PS/2 cu fir (3 butoane).
   - Calculator cu Vivado (minim versiunea 2016.4).

2. **Configurare și instalare**:
   - Descărcați proiectul de pe [link-ul proiectului](https://drive.google.com/file/d/1wRgoy97DM6sI4cW0oLSznB3Ja7ju7gKj/view?usp=drive_link).
   - Dezarhivați fișierele și deschideți proiectul `.xpr` în Vivado.
   - Conectați plăcuța FPGA la calculator folosind un cablu micro-USB.
   - Compilați și încărcați proiectul pe placă.

3. **Control sistem**:
   - Click stânga: Incrementare.
   - Click dreapta: Decrementare.
   - Buton reset: Resetare la `0000`.
   - Switch revers: Inversare funcții mouse.

## Dezvoltări Ulterioare

- Implementarea numărării în sens negativ pentru click-uri.
- Optimizarea divizorului de frecvență pentru SSD.
- Gestionarea avansată a erorilor (debouncing și sincronizare).
- Extinderea funcționalităților pentru alte interfețe hardware (de exemplu, tastaturi).

## Resurse

- [Documentația Basys3](https://digilent.com/reference/programmable-logic/basys-3/start).
- [Ghid utilizare Vivado](https://www.xilinx.com/support/download.html).
- [Cod sursă proiect](https://drive.google.com/file/d/1wRgoy97DM6sI4cW0oLSznB3Ja7ju7gKj/view?usp=drive_link).

