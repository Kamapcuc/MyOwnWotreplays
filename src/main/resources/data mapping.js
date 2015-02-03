PUT data/tank/_mapping
{
	"tank" : {
		"properties" : {
		"class" : {
				"type" : "string",
				"index" : "not_analyzed"
			},
			"level" : {
				"type" : "byte"
			},
			"nation" : {
				"type" : "string",
				"index" : "not_analyzed"
			}
		}
	}
}