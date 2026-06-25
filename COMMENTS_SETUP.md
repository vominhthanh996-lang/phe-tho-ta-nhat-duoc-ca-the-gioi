# Bat binh luan chung voi Supabase

Web GitHub Pages la static site, nen binh luan chung can mot database ben ngoai. Repo nay da co san frontend va schema cho Supabase.

## 1. Tao Supabase project

1. Vao https://supabase.com/ va tao project moi.
2. Mo `SQL Editor`.
3. Copy toan bo noi dung file `supabase-comments-schema.sql`.
4. Chay SQL de tao bang `public.comments`, index va RLS policies.

## 2. Lay config

Trong Supabase dashboard:

1. Vao `Project Settings` -> `API`.
2. Copy `Project URL`.
3. Copy `anon public` key.

Khong dua `service_role` key len web.

## 3. Dan vao web

Sua file `doc-truyen-vip/supabase-config.js`:

```js
window.SUPABASE_CONFIG = {
  url: "https://your-project.supabase.co",
  anonKey: "your-anon-public-key"
};
```

Sau do commit va push len `main`. Khi config dung, web se hien che do "Binh luan chung" va moi doc gia se thay cung mot danh sach binh luan.

## 4. An binh luan xau

Tam thoi moderation lam trong Supabase dashboard:

```sql
update public.comments
set is_hidden = true
where id = 'COMMENT_ID_CAN_AN';
```

Binh luan bi an se khong hien tren web nua.

