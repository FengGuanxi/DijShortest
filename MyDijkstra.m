clc,clear;
global D;
D=[0,2,1,4,5,1;
   2,0,4,2,3,4;
   1,4,0,1,2,4;
   4,2,1,0,3,3;
   5,3,2,3,0,1;
   1,4,4,3,1,0];
[d,index2] = Dijkstra(1)


%ע����ݴ��������������ͼ�����·��
function [d,index2] = Dijkstra(s)%sΪԴ��(��һ�����֣���Χ����1��length(D)) 
%����: d��a������ľ���
%index2ǰ�����������ʼ�㵽��i�����ͨ·�е�i����ǰһ��������
%��ô��index2������·���μӸ����е�pdf��marddown�ļ�

    global D;
    pb(1:length(D))=0;
    pb(s)=1;  %��һ�����Ѿ������ԭ�����̾���ʱ�����±�i��Ӧ��pb(i)��1
    index1=s; %��Ŵ���S���ϵ�˳��
    index2=ones(1,length(D))*-1; %���ʼ�㵽��i�����ͨ·�е�i����ǰһ��������
    d(1:length(D))=inf;
    d(s)=0;  %�����ʼ�㵽��i�����ͨ·��ֵ

    temp=s;  %temp��ʾs,��s������������·��
    while sum(pb)<length(D)  %���Ƿ����еĵ㶼���ΪP���
        tb=find(pb==0); %�ҵ����Ϊ0�����е�,���ҵ���û�д���S�ĵ�
        d(tb)=min(d(tb),d(temp)+D(temp,tb));%������Ϊ0�ĵ�����·�������Ǵ�ԭ��ֱ�ӵ�����㣬�ֻ�����ԭ�㾭��r1,��ӵ��������
        tmpb=find(d(tb)==min(d(tb)));  %��d[tb]������Сֵ���±�
        temp=tb(tmpb(1));%�����ж���·��ͬʱ������Сֵ��ȡ����һ����tempҲ��ԭ���Ϊ��һ����
        pb(temp)=1;%�ҵ���С·���ı��Ӧ��pb(i)=1
        index1=[index1,temp];  %��Ŵ���S���ϵ�˳��
        temp2=find(d(index1)==d(temp)-D(temp,index1));
        index2(temp)=index1(temp2(1)); %��¼�������
    end

end
