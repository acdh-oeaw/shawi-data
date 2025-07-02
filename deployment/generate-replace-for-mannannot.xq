(: remove replace lines from deplayment script and activate add 
 : * Create an _empty_ `vicav_corpus` database (New..., Import empty, type db name)
 : * Properties... -> Add all the files from `103_tei_w`
 : * Properties... -> Add all the files from `010_manannot`
 :)
for $doc in collection('vicav_corpus')/*
group by $uri := replace($doc/base-uri(), '/vicav_corpus/(103_tei_w|010_manannot)/', '', '')
where count($doc) > 1
order by $uri
return <replace path="/shawi/{$uri}">../shawi-data/010_manannot/{$uri}</replace>,
for $doc in collection('vicav_corpus')/*
group by $uri := replace($doc/base-uri(), '/vicav_corpus/(103_tei_w|010_manannot)/', '', '')
where count($doc) = 1
order by $uri
where contains($doc/base-uri(), '010_manannot')
return <add path="/shawi/{$uri}">../shawi-data/010_manannot/{$uri}</add>