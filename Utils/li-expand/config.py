conf = {
    # Приклад використання:
    # Шукатиме <Hospitality_Refugee.questContentRules.rulesStrings>
    # "Hospitality_Refugee.questDescriptionAndNameRules.rulesStrings": {
    #     Далі воно шукає <li>, що починаються з lodgersLabel-> та копіює
    #     їх на кожен елемент із заданого списку, заміняючи lodgersLabel->
    #     на рядок зі списку
    #     "lodgersLabel->": [
    #         [
    #             "lodgersLabel(lodgers0_gender==Male)->",
    #             "lodgersLabel(lodgers0_gender==Female)->",
    #             "lodgersLabelGen(lodgers0_gender==Male)->",
    #             "lodgersLabelGen(lodgers0_gender==Female)->",
    #             "lodgersLabelAcc(lodgers0_gender==Male)->",
    #             "lodgersLabelAcc(lodgers0_gender==Female)->",
    #         ],
    #         Тут вказується чи видаляти оригінальний lodgersLabel->
    #         Якщо не вказувати, рахується як False
    #         True
    #     ],
    #     "lodgersLabelPlural->": [
    #         [
    #             "lodgersLabelPluralGen->",
    #             "lodgersLabelPluralAcc->",
    #         ],
    #     ],
    # },
    "GrowthMomentFlavor.rulePack.rulesStrings": {
        "nounFuture->": [
            ["nounFutureGen->"],
        ],
        "situationLearning->": [
            ["situationLearningVerb->"]
        ],
        "situationBad->": [
            ["situationBadGen->"],
        ],
        "taskWork->": [
            ["taskWorkIns->"],
        ],
        "enemyNamePlural->": [
            ["enemyNamePluralIns->"],
        ],
        "friendNamePlural->": [
            [
                "friendNamePluralIns->",
                "friendNamePluralDat->"
            ],
        ],
    },
    "Hospitality_Refugee.questDescriptionAndNameRules.rulesStrings": {
        "lodgersLabel->": [
            [
                "lodgersLabel(lodgers0_gender==Male)->",
                "lodgersLabel(lodgers0_gender==Female)->",
                "lodgersLabelGen(lodgers0_gender==Male)->",
                "lodgersLabelGen(lodgers0_gender==Female)->",
                "lodgersLabelAcc(lodgers0_gender==Male)->",
                "lodgersLabelAcc(lodgers0_gender==Female)->",
            ],
            True
        ],
        "lodgersLabelPlural->": [
            [
                "lodgersLabelPluralGen->",
                "lodgersLabelPluralAcc->",
            ],
        ],
    },
    "RefugeeBetrayal.questDescriptionAndNameRules.rulesStrings": {
        "lodgersLabel->": [
            [
                "lodgersLabel(lodgers0_gender==Male)->",
                "lodgersLabel(lodgers0_gender==Female)->",
                "lodgersLabelGen(lodgers0_gender==Male)->",
                "lodgersLabelGen(lodgers0_gender==Female)->",
                "lodgersLabelAcc(lodgers0_gender==Male)->",
                "lodgersLabelAcc(lodgers0_gender==Female)->",
            ],
            True
        ],
        "lodgersLabelPlural->": [
            [
                "lodgersLabelPluralGen->",
                "lodgersLabelPluralAcc->",
            ],
        ],
    },
    "Hospitality_Joiners.questDescriptionAndNameRules.rulesStrings": {
        "lodgersLabel->": [
            [
                "lodgersLabel(lodgers0_gender==Male)->",
                "lodgersLabel(lodgers0_gender==Female)->",
                "lodgersLabelGen(lodgers0_gender==Male)->",
                "lodgersLabelGen(lodgers0_gender==Female)->",
                "lodgersLabelAcc(lodgers0_gender==Male)->",
                "lodgersLabelAcc(lodgers0_gender==Female)->",
            ],
            True,
        ],
    },
    "Hospitality_Prisoners.questDescriptionAndNameRules.rulesStrings": {
        "lodgersLabel->": [
            [
                "lodgersLabel(lodgers0_gender==Male)->",
                "lodgersLabel(lodgers0_gender==Female)->",
                "lodgersLabelGen(lodgers0_gender==Male)->",
                "lodgersLabelGen(lodgers0_gender==Female)->",
                "lodgersLabelAcc(lodgers0_gender==Male)->",
                "lodgersLabelAcc(lodgers0_gender==Female)->",
            ],
            True
        ],
        "lodgersLabelPlural->": [
            [
                "lodgersLabelPluralGen->",
                "lodgersLabelPluralAcc->",
            ],
        ],
    },
}