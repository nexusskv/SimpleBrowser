//
//  CollectViewDataSource.m
//  SimpleBrowser
//
//  Created by rost on 24.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "CollectViewDataSource.h"

@implementation CollectViewDataSource


+ (CollectViewDataSource *)shared
{
    static dispatch_once_t predicate;
    static CollectViewDataSource *sharedFoo;
    
    dispatch_once(&predicate, ^{
        sharedFoo = [[CollectViewDataSource alloc] init];
    });
    
    return sharedFoo;
}

- (NSArray *)getLinksArray
{
    return [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:
                                      @"Google",             @"title",
                                      @"www.google.com",     @"link",
                                      @"google_logo",        @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Facebook",            @"title",
                                     @"www.facebook.com",    @"link",
                                     @"fb_logo",             @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Вконтакте",           @"title",
                                     @"www.vk.com",          @"link",
                                     @"vk_logo",             @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Twitter",             @"title",
                                     @"www.twitter.com",     @"link",
                                     @"twitter_logo",        @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"LinkedIn",            @"title",
                                     @"www.linkedin.com",    @"link",
                                     @"linkedin_logo",       @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"StackOverflow",          @"title",
                                     @"www.stackoverflow.com",  @"link",
                                     @"stack_ov_logo",          @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Habrahabr",          @"title",
                                     @"www.habrahabr.com",  @"link",
                                     @"habra_logo",         @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Dou",            @"title",
                                     @"www.dou.ua",     @"link",
                                     @"dou_logo",       @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Вести",            @"title",
                                     @"www.vesti.ua",     @"link",
                                     @"vesti_logo",       @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Харьков UA",       @"title",
                                     @"www.kharkov.ua",   @"link",
                                     @"kh_ua_logo",       @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Gismeteo",                            @"title",
                                     @"www.gismeteo.ua/city/weekly/5053/",   @"link",
                                     @"gismeteo_logo",                       @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"YouTube",           @"title",
                                     @"www.youtube.com",   @"link",
                                     @"youtube_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Amazon",           @"title",
                                     @"www.amazon.com",   @"link",
                                     @"amazon_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Bing",           @"title",
                                     @"www.bing.com",   @"link",
                                     @"bing_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Pinterest",           @"title",
                                     @"www.pinterest.com",   @"link",
                                     @"pinterest_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Tumlbr",           @"title",
                                     @"www.tumblr.com",   @"link",
                                     @"tumblr_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Instagram",           @"title",
                                     @"www.instagram.com",   @"link",
                                     @"instagram_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Flickr",                   @"title",
                                     @"www.flickr.com",   @"link",
                                     @"flickr_logo",              @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Vimeo",           @"title",
                                     @"www.vimeo.com",   @"link",
                                     @"vimeo_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Rambler",           @"title",
                                     @"www.rambler.com",   @"link",
                                     @"rambler_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Wikipedia",           @"title",
                                     @"www.wikipedia.org",   @"link",
                                     @"wikipedia_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Xing",           @"title",
                                     @"www.xing.com",   @"link",
                                     @"xing_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Ning",           @"title",
                                     @"www.ning.com",   @"link",
                                     @"ning_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Lenta",          @"title",
                                     @"www.lenta.ru",   @"link",
                                     @"lenta_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Webs",           @"title",
                                     @"www.webs.com",   @"link",
                                     @"webs_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Github",           @"title",
                                     @"www.github.com",   @"link",
                                     @"github_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Yandex",          @"title",
                                     @"www.yandex.ua",   @"link",
                                     @"yandex_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Bloomberg",           @"title",
                                     @"www.bloomberg.com",   @"link",
                                     @"bloomberg_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Washington Post",          @"title",
                                     @"www.washingtonpost.com",   @"link",
                                     @"washingtonpost_logo",      @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Djinni",          @"title",
                                     @"www.djinni.co",   @"link",
                                     @"djinni_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Rabota",          @"title",
                                     @"www.rabota.ua",   @"link",
                                     @"rabota_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Head Hunter",    @"title",
                                     @"www.hh.ua",      @"link",
                                     @"hh_logo",        @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Rabota in Kharkov",       @"title",
                                     @"www.rabota.kharkov.ua",   @"link",
                                     @"rabotakhark_logo",        @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Jooble",             @"title",
                                     @"www.jooble.com.ua",  @"link",
                                     @"jooble_logo",        @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Indeed",          @"title",
                                     @"www.indeed.com",  @"link",
                                     @"indeed_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Mashable",          @"title",
                                     @"www.mashable.com",  @"link",
                                     @"mashable_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Forbes",          @"title",
                                     @"www.forbes.com",  @"link",
                                     @"forbes_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Korrespondent",          @"title",
                                     @"www.korrespondent.net",  @"link",
                                     @"korr_logo",              @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Walmart",          @"title",
                                     @"www.walmart.com",  @"link",
                                     @"walmart_logo",     @"logo", nil],
                                    [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"Ask",          @"title",
                                     @"www.ask.com",  @"link",
                                     @"ask_logo",     @"logo", nil], nil];
}

@end
