-- Run this in Supabase SQL Editor to store the new public thumbnail in the database.
update public.stories
set cover = 'assets/phe-tho-ta-nhat-duoc-ca-the-gioi-thumb.webp',
    db_updated_at = now()
where id = 'phe-tho-ta-nhat-duoc-ca-the-gioi';
