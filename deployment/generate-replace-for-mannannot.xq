(: remove replace lines from deplayment script and activate add :)
for $doc in collection('vicav_corpus')/*
group by $uri := replace($doc/base-uri(), '/vicav_corpus/', '', 'q')
where count($doc) > 1
order by $uri
return <replace path="{$uri}">../shawi-data/010_manannot/{$uri}</replace>