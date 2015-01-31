PUT replays/battle/_mapping
{
	"battle" : {
		"properties" : {
			"version" : {
				"type" : "string",
				"index" : "not_analyzed"
			},
			"map" : {
				"type" : "string",
				"index" : "not_analyzed"
			},
			"playerName" : {
				"type" : "string",
				"index" : "not_analyzed"
			},
			"tankLevel" : {
				"type" : "byte",
				"store" : false
			},
			"tankNation" : {
				"type" : "string",
				"index" : "not_analyzed",
				"store" : false
			},
			"tankClass" : {
				"type" : "string",
				"index" : "not_analyzed",
				"store" : false
			},
			"tank" : {
				"type" : "string",
				"index" : "not_analyzed"
			}
		}
	}
}