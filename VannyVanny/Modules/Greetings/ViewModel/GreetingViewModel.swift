//
//  GreetingViewModel.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import Foundation

@Observable
class GreetingViewModel {
    var displayedLines: [String] = []
    var currentIndex = 0
    var fullText: String =
 """
 안녕 러너! 내 사과농장에 온 걸 환영해.
 나는 사과 농장의 농부, 곰민이야.
 러너가 고민을 나누면, 씨앗이 심기고,
 나와 대화를 나누는 동안 점점 자라날거야.
 고민 나무에 응원을 남기면, \n나무에 열매가 열릴 거야! 🍎
 요즘 마음에 걸리는 일이 있다면 편하게 이야기 해줘!

 """
}
