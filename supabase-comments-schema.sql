create table if not exists public.comments (
  id uuid primary key default gen_random_uuid(),
  target_key text not null,
  story_id text not null,
  chapter_id text,
  author text not null,
  body text not null,
  is_hidden boolean not null default false,
  created_at timestamptz not null default now(),
  constraint comments_target_key_format check (
    target_key ~ '^(story|chapter):[a-z0-9-]+(:c[0-9]{3})?$'
  ),
  constraint comments_author_length check (
    char_length(btrim(author)) between 1 and 40
  ),
  constraint comments_body_length check (
    char_length(btrim(body)) between 2 and 800
  )
);

create index if not exists comments_target_visible_created_idx
  on public.comments (target_key, is_hidden, created_at desc);

create index if not exists comments_story_chapter_idx
  on public.comments (story_id, chapter_id, created_at desc);

alter table public.comments enable row level security;

drop policy if exists "Public can read visible comments" on public.comments;
create policy "Public can read visible comments"
  on public.comments
  for select
  to anon, authenticated
  using (is_hidden = false);

drop policy if exists "Public can create comments" on public.comments;
create policy "Public can create comments"
  on public.comments
  for insert
  to anon, authenticated
  with check (
    is_hidden = false
    and char_length(btrim(author)) between 1 and 40
    and char_length(btrim(body)) between 2 and 800
  );
