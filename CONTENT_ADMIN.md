# Quan tri noi dung truyen

Day la cach dang chuong moi cho web hien tai. Web dang chay tren GitHub Pages nen noi dung duoc build thanh file static `doc-truyen-vip/data.js`.

## Noi viet truyen

Ban viet va sua truyen trong:

```text
E:\ThanhMV\Content truyen\phe-tho-ta-nhat-duoc-ca-the-gioi
```

Moi phan can nam theo dang:

```text
tap-xx-ten-tap\ban-v3-dai-than\phan-xx-ten-phan.md
```

## Len web production

Khi muon day chuong moi len web, mo PowerShell tai repo nay va chay:

```powershell
powershell -ExecutionPolicy Bypass -File tools\publish_story_content.ps1
```

Script se tu lam:

1. Kiem tra job audio co dang chay khong.
2. Copy markdown tu `E:\ThanhMV\Content truyen`.
3. Build lai `doc-truyen-vip/data.js`.
4. Kiem tra so chuong va chuong cuoi.
5. Commit va push len GitHub Pages.

Neu audio dang chay, script se dung lai de tranh data/audio bi lech nhau.

## Kiem tra web

Production URL:

```text
https://vominhthanh996-lang.github.io/truyen-2k/
```

## Luu y

- Hien tai tat ca chuong dang free.
- Audio chay bang job rieng, khong nen publish text trong luc job audio dang gen.
- Binh luan chung can Supabase config trong `doc-truyen-vip/supabase-config.js`.

