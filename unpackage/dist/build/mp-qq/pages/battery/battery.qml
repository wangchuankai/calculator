<view class="box data-v-657aa364"><view class="mytab data-v-657aa364"><block wx:for="{{tabList}}" wx:for-item="ite" wx:for-index="index" wx:key="index"><view data-event-opts="{{[['tap',[['tabClick',['$0'],[[['tabList','',index]]]]]]]}}" class="{{['tabItem data-v-657aa364',ite==activeItem?'activeTab':'']}}" bindtap="__e">{{''+ite+''}}</view></block></view><block wx:if="{{countMoth}}"><view class="title data-v-657aa364">{{''+activeItem+(activeItem!=="我的"?"的":'')+"人生进度：一共"+countMoth+"个月(每个小格代表一个月)，已度过"+(usemoth===0?"0":usemoth)+'个月（黄色部分）'}}</view></block><block wx:if="{{countMoth}}"><view class="myBox data-v-657aa364"><block wx:for="{{myTotallist}}" wx:for-item="item" wx:for-index="i" wx:key="i"><view class="{{['item data-v-657aa364','item'+item]}}"></view></block></view></block><block wx:if="{{!countMoth}}"><view class="massage data-v-657aa364"><image style="width:200px;height:200px;margin:0 auto;display:block;" src="../../static/kong.png" mode class="data-v-657aa364"></image><view class="txt data-v-657aa364" style="text-align:center;">请完善" 我的 "页面信息后查看</view></view></block><button class="normalbtn data-v-657aa364" type="default" data-event-opts="{{[['tap',[['addClick',['$event']]]]]}}" bindtap="__e">看到了点击一下吧</button><view class="adbanner data-v-657aa364"><ad unit-id="3bb05f156229fef740d3c963b0b0d538" class="data-v-657aa364"></ad></view></view>