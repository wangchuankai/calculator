<view class="myindex"><view class="uni-center mytitle">日期与日期间的相隔时间</view><view class="uni-list"><view class="uni-list-cell"><view class="uni-list-cell-left">开始日期：</view><view class="uni-list-cell-db"><picker mode="date" value="{{start_date}}" start="{{startDate}}" data-event-opts="{{[['change',[['bindStartDateChange',['$event']]]]]}}" bindchange="__e"><view class="uni-input">{{start_date}}</view></picker></view></view><view class="uni-list-cell"><view class="uni-list-cell-left">结束日期：</view><view class="uni-list-cell-db"><picker mode="date" value="{{end_date}}" start="{{startDate}}" end="{{endDate}}" data-event-opts="{{[['change',[['bindEndDateChange',['$event']]]]]}}" bindchange="__e"><view class="uni-input">{{end_date}}</view></picker></view></view></view><view class="myprimary"><button type="primary" disabled="{{isDis}}" data-event-opts="{{[['tap',[['count',['$event']]]]]}}" bindtap="__e">计算</button></view><view class="result"><block wx:if="{{showmsg}}"><view class="mytitle">开始时间与结束时间相同无时间间隔</view></block><block wx:if="{{showmsg1}}"><view class="mytitle">开始时间不可以大于结束时间</view></block><block wx:if="{{!showmsg1&&!showmsg}}"><view><block wx:if="{{year||month||day}}"><view><view class="mytitle">相隔时间计算结果：</view><view class="resNum"><block wx:if="{{year}}"><text>{{year+" 年,"}}</text></block><block wx:if="{{month}}"><text>{{month+" 月,"}}</text></block><block wx:if="{{day}}"><text>{{day+" 天。"}}</text></block></view><block wx:if="{{countY||countM||countD}}"><view class="mytitle">分别按照年、月、日合计：</view></block><view class="resNum"><block wx:if="{{countY}}"><text>{{countY+" 年"}}</text></block></view><view class="resNum"><block wx:if="{{countM}}"><text>{{countM+" 月"}}</text></block></view><view class="resNum"><block wx:if="{{countD}}"><text>{{countD+" 天"}}</text></block></view></view></block></view></block></view><view class="adbanner"></view></view>