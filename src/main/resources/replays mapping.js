PUT replays/battle/_mapping
{
	"battle" : {
		"properties" : {
			"battleDate" : {
				"type" : "date",
				"format" : "dateOptionalTime"
			},
			"version" : {
				"type" : "string",
				"index" : "not_analyzed"
			},
			"map" : {
				"type" : "string"
			},
			"personal" : {
				"type" : "string"
			},
			"playerName" : {
				"type" : "string"
			},
			"tank" : {
				"properties" : {
					"class" : {
						"type" : "string"
					},
					"id" : {
						"type" : "string"
					},
					"level" : {
						"type" : "long"
					},
					"nation" : {
						"type" : "string"
					}
				}
			},
			"test" : {
				"type" : "long"
			}
		}
	}
}
