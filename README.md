# README

## Формат запросов

Получение списка спектаклей
```
GET [url]/perfomances
```

Добавление спектакля

```
POST [url]/perfomances
Content-Type: application/json
пример json

{
	"performance": {
		"name": "Ромео и Джульетта",
		"duration": {
			"start_date": "2018-07-30", 
			"end_date": "2018-08-31"
		}
	}
}
```