!#env /bin/bash
# search hits
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus?query=awwal&render=json' > corpus_hits.ndjson
echo '' >> corpus_hits.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus?query=ma&render=json' >> corpus_hits.ndjson
cat corpus_hits.ndjson | docker run -i --rm michaelmior/jsonoid-discovery -- -d --max-examples 8 > corpus_hits_schema.json 
cat corpus_hits_schema.json | yq -p json -oy 'del(.. | select(has("bloomFilter")).bloomFilter, .. | select(has("hll")).hll, .. | select(has("lengthHistogram")).lengthHistogram,.. | select(has("fieldPresence")).fieldPresence)'> corpus_hits_schema.yaml
# curpus texts
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-177&render=json' > corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-133&render=json' >> corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-107&render=json' >> corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-068&render=json' >> corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-094&render=json' >> corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-179&render=json' >> corpus_texts.ndjson
echo '' >> corpus_texts.ndjson
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/vicav/corpus_text?id=URFA-032&render=json' >> corpus_texts.ndjson
cat corpus_texts.ndjson | docker run -i --rm michaelmior/jsonoid-discovery -- -d --max-examples 8 > corpus_texts_schema.json
cat corpus_texts_schema.json | yq -p json -oy 'del(.. | select(has("bloomFilter")).bloomFilter, .. | select(has("hll")).hll, .. | select(has("lengthHistogram")).lengthHistogram,.. | select(has("fieldPresence")).fieldPresence)'> corpus_texts_schema.yaml
curl -H 'Accept: application/json' 'https://shawi.acdh-ch-dev.oeaw.ac.at/restvle/dicts/dc_shawi_eng/entries?pageSize=200&format=json' > dicts.ndjson
echo '' >> dicts.ndjson
curl -H 'Accept: application/json' 'https://vicav-dev.acdh.oeaw.ac.at//restvle/dicts/dc_arz_eng_publ/entries?pageSize=200&format=json' >> dicts.ndjson
cat dicts.ndjson | docker run -i --rm michaelmior/jsonoid-discovery -- -d --max-examples 8 > dicts-schema.json
cat dicts-schema.json | yq -p json -oy 'del(.. | select(has("bloomFilter")).bloomFilter, .. | select(has("hll")).hll, .. | select(has("lengthHistogram")).lengthHistogram,.. | select(has("fieldPresence")).fieldPresence)'> dicts-schema.yaml