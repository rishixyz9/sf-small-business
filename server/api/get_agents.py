import json
from collections import defaultdict

def get_matches(weightages):
    with open('./api/agents.json', 'r') as file:
        agents = json.load(file)["agents"]

    res = []
    for agent in list(agents.keys()):
        res.append(score_calculation(weightages["policies"], agents[agent], agent))


    return json.loads(json.dumps(sorted(res, key=lambda x: x['weighted_score'], reverse=True)))

def score_calculation(user_data, agent_data, agent_name):
    total_score = 0

    for policy in user_data:
        total_score += policy["score"]

    res = {
        "name": agent_name,
        "weighted_score":0, 
        "score_breakdown":
            {policy["tag"]: agent_data[policy["tag"]] for policy in user_data} 
    }

    #calculate weighted score
    for policy in user_data:
       res["weighted_score"] += (policy["score"]/total_score) * agent_data[policy["tag"]]

    #calculate match and score breakdown
    for policy in user_data:
        res["score_breakdown"][policy["tag"]] = ((policy["score"]/total_score) * agent_data[policy["tag"]])/res["weighted_score"]

    return res    