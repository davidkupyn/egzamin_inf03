select nazwa, wystepowanie, wojewodztwo from ryby;
join lowisko on ryby.id = lowisko.ryby_id;
where rodzaj = 3;