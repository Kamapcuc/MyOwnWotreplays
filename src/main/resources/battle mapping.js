PUT data/tank/_mapping
{
  "tank": {
    "properties": {
      "class": {
        "type": "string",
        "index": "not_analyzed"
      },
      "level": {
        "type": "long",
        "index": "not_analyzed"
      },
      "nation": {
        "type": "string",
        "index": "not_analyzed"
      }
    }
  }
}
